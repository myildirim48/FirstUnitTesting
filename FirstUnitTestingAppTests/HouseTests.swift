//
//  HouseTests.swift
//  FirstUnitTestingAppTests
//
//  Created by YILDIRIM on 7.06.2023.
//

import XCTest
@testable import FirstUnitTestingApp

final class HouseTests: XCTestCase {

    func test4Bed2BathHouse_Fits3Bed2BathRequirements() {
        // given
        let house = House(bedrooms: 4, bathrooms: 2)
        let desiredBedrooms = 3
        let desiredBathrooms = 2

        // when
        let suitability = house.checkSuitability(desiredBedrooms: desiredBedrooms, desiredBathrooms: desiredBathrooms)

        // then
        XCTAssertTrue(suitability)
    }
}
