//
//  Hater.swift
//  FirstUnitTestingApp
//
//  Created by YILDIRIM on 6.06.2023.
//

import Foundation
struct Hater {
    var hating = false

    mutating func hadABadDay() {
        hating = true
    }

    mutating func hadAGoodDay() {
        hating = false
    }
}
