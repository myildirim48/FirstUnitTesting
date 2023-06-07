//
//  PrimeCalculatorTests.swift
//  FirstUnitTestingAppTests
//
//  Created by YILDIRIM on 7.06.2023.
//

import XCTest
@testable import FirstUnitTestingApp

final class PrimeCalculatorTests: XCTestCase {
    
    
    
    func testPrimesUpTo100ShouldBe25() {
        // given
        let maximumCount = 100
        // when
        let progress = PrimeCalculator.calculate(upTo: maximumCount) {
            XCTAssertEqual($0.count, 25)
        }
        
        // then
        let predicate = NSPredicate(
            format: "%@.completedUnitCount == %@", argumentArray: [progress, maximumCount]
        )
        
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: progress)
        wait(for: [expectation], timeout: 10)
    }
    
}
