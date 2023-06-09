//
//  NewsNetworkingTests.swift
//  FirstUnitTestingAppTests
//
//  Created by YILDIRIM on 8.06.2023.
//

import XCTest
@testable import FirstUnitTestingApp

class DataTaskMock: URLSessionDataTask {
    var completionHandler: (Data?, URLResponse?, Error?) -> Void
        var resumeWasCalled = false

        // stash away the completion handler so we can call it later
        init(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
            self.completionHandler = completionHandler
        }

        override func resume() {
            // resume was called, so flip our boolean and call the completion
            resumeWasCalled = true
            completionHandler(nil, nil, nil)
        }
}
class URLSessionMock: URLSessionProtocol {
    
    var dataTask: DataTaskMock?

        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            let newDataTask = DataTaskMock(completionHandler: completionHandler)
            dataTask = newDataTask
            return newDataTask
        }
}

final class NewsNetworkingTests: XCTestCase {
    func testNewsFetchLoadsCorrectURL() {
        // given
        let url = URL(string: "https://www.apple.com/newsroom/rss-feed.rss")!
        let news = NewsNetworking(url: url)
        let session = URLSessionMock()
        let expectation = XCTestExpectation(description: "Downloading news stories.")

        // when
        news.fetch(using: session) {
            XCTAssertTrue(session.dataTask?.resumeWasCalled ?? false)
            expectation.fulfill()
        }

        // then
        wait(for: [expectation], timeout: 5)
    }
}
