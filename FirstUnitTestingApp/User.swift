//
//  User.swift
//  FirstUnitTestingApp
//
//  Created by YILDIRIM on 7.06.2023.
//

import Foundation
struct User {
    let upgradedNotification = Notification.Name("UserUpgraded")

        func upgrade(using center: NotificationCenter = NotificationCenter.default) {
            DispatchQueue.global().async {
                Thread.sleep(forTimeInterval: 1)
                center.post(name: self.upgradedNotification, object: nil, userInfo: ["level": "gold"])
            }
        }
}
