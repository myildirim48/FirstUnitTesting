//
//  MockingTests.swift
//  FirstUnitTestingAppTests
//
//  Created by YILDIRIM on 8.06.2023.
//

import XCTest

//Here is a example for mocking how we start
private class WithoutProtocol {
    class Buyer {
        func view(_ house: House) {
            house.conductViewing()
        }
    }
    class House {
        var numberOfViewings = 0

        func conductViewing() {
            numberOfViewings += 1
        }
    }
}
// -----> FOR MOCKING WE NEED TO USE PROTOCOLS <-----
protocol HouseProtocol {
    var numberOfViewings: Int { get set }
    func conductViewing()
}

class HouseClass: HouseProtocol {
    var numberOfViewings: Int = 0
    
    func conductViewing() {
        numberOfViewings += 1
    }

}

class Buyer {
    func view(_ house: HouseProtocol) {
        house.conductViewing()
    }
}

//------MOCKING

class MockHouse: HouseProtocol {
    var numberOfViewings: Int = 0
    
    func conductViewing() {
        numberOfViewings += 1
    }
    
    
}

final class MockingTests: XCTestCase {

    func testBuyerViewingHouseAddsOneToViewings() {
        //        Given
        let buyer = Buyer()
        let house = MockHouse()
        //        When
        buyer.view(house)
        //        Then
        XCTAssertEqual(house.numberOfViewings, 1)
    }
    
}
