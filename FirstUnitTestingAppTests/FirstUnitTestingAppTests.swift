//
//  FirstUnitTestingAppTests.swift
//  FirstUnitTestingAppTests
//
//  Created by YILDIRIM on 6.06.2023.
//

import XCTest
@testable import FirstUnitTestingApp

final class FirstUnitTestingAppTests: XCTestCase {
    
    var hater: Hater!
    
    override func setUp() {
        hater = Hater()
    }
    
    override func tearDown() {
        hater = nil
    }

    func testHaterStartsNicely() {
        let hater = Hater()

        XCTAssertFalse(hater.hating)
    }
    func testHaterHatesAfterBadDay() {
        var hater = Hater()

        hater.hadABadDay()

        XCTAssertTrue(hater.hating)
    }

    func testHaterHappyAfterGoodDay() {
        var hater = Hater()

        hater.hadAGoodDay()

        XCTAssertFalse(hater.hating)
    }
    
}
