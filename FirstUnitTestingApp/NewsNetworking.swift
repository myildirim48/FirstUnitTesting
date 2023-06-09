//
//  NewsNetworking.swift
//  FirstUnitTestingApp
//
//  Created by YILDIRIM on 8.06.2023.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {
    
}

class NewsNetworking {
    var url: URL
    var stories = ""
    
    init(url: URL) {
        self.url = url
    }
    
    func fetch(using session: URLSessionProtocol = URLSession.shared, completionHandler: @escaping() -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
            if let data  {
                self.stories = String(decoding: data, as: UTF8.self)
            }
            
            completionHandler()
        }
        task.resume()
    }
}
