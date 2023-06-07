//
//  Converter.swift
//  FirstUnitTestingApp
//
//  Created by YILDIRIM on 6.06.2023.
//

import Foundation
struct Converter {
    func convertToCelsius(fahrenheit: Double) -> Double {
        let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
        let celcius = fahrenheit.converted(to: .celsius)
        return celcius.value
    }
}
