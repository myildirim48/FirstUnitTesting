//
//  PerformansTesting.swift
//  FirstUnitTestingAppTests
//
//  Created by YILDIRIM on 7.06.2023.
//

import XCTest

final class PerformansTesting: XCTestCase {
    
    func calculate(upTo max: Int) -> [Int] {
        guard max > 1 else {
            return []
        }
        
        var sieve = [Bool](repeating: true, count: max)
        sieve[0] = false
        sieve[1] = false
        
        for number in 2 ..< max {
            if sieve[number] == true {
                for multiple in stride(from: number * number, to: sieve.count, by: number) {
                    sieve[multiple] = false
                }
            }
        }
        
        let primes = sieve.enumerated().compactMap { $1 == true ? $0 : nil }
        return primes
        
    }

    func testPrimePerformance() {
        measure {
            _ = calculate(upTo: 1_000_000)
        }
    }
}
