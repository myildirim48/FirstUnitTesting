//
//  ConverterTests.swift
//  FirstUnitTestingAppTests
//
//  Created by YILDIRIM on 6.06.2023.
//

import XCTest
@testable import FirstUnitTestingApp

final class ConverterTests: XCTestCase {
    
    var sut: Converter!
    
    override func setUp() {
        sut = Converter()
    }
    
    override func tearDown() {
        sut = nil
    }

    func test32FahrenheitIsZeroCelsius() {
//        Given
        let input1 = 32.0
//        When
        let output1 = sut.convertToCelsius(fahrenheit: input1)
    
//        Then
        XCTAssertEqual(output1, 0, accuracy: 0.000001)
        
    }
    func test212FahrenheitIs100Ceclsius() {
        //        Given
        let input2 = 212.0
        //        When
        let output2 = sut.convertToCelsius(fahrenheit: input2)
        //        Then
        XCTAssertEqual(output2, 100, accuracy: 0.000001)
    }
    
    func test100FahrenheitIs37Celsius() {
        //        Given
        let input = 100.0
        //        When
        let output = sut.convertToCelsius(fahrenheit: input)
        //        Then
        XCTAssertEqual(output, 37.777777, accuracy: 0.000001)
    }
}
