//
//  NotificationTests.swift
//  FirstUnitTestingAppTests
//
//  Created by YILDIRIM on 7.06.2023.
//

import XCTest
@testable import FirstUnitTestingApp

final class NotificationTests: XCTestCase {

    func testUserUpgradedPostNotification() {
        //        Given
            let center = NotificationCenter()
            let user = User()
            let expectation = XCTNSNotificationExpectation(name: user.upgradedNotification, object: nil, notificationCenter: center)
        expectation.handler = { notification -> Bool in
                guard let level = notification.userInfo?["level"] as? String else {
                    return false
                }

                if level == "gold" {
                    return true
                } else {
                    return false
                }
            }

            // when
            user.upgrade(using: center)

            // then
            wait(for: [expectation], timeout: 3)
    }

}
