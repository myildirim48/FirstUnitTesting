//
//  DependencyInjectiınTests.swift
//  FirstUnitTestingAppTests
//
//  Created by YILDIRIM on 7.06.2023.
//

import XCTest
@testable import FirstUnitTestingApp

struct UnreleasedAppStub: AppProtocol {
    var price: Decimal = 0
    var minimumAge = 0
    var isReleased = false
    
    func canBePurchased(by user: UserProtocol) -> Bool {
        return false
    }
}
final class DependencyInjectionTests: XCTestCase {
    
    func testUserCantBuyUnreleasedApp() {
        // given
        var sut = UserDependency(funds: 100, age: 21, apps: [])
        let app = UnreleasedAppStub()
        
        // when
        let wasBought = sut.buy(app)
        
        // then
        XCTAssertFalse(wasBought)
    }
    
}
