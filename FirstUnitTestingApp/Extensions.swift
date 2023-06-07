//
//  Extensions.swift
//  FirstUnitTestingApp
//
//  Created by YILDIRIM on 7.06.2023.
//

import Foundation
extension LocalizedError {
    var errorDescription: String? {
        return "\(self)"
    }
}
extension Array where Element: Comparable {
    func fuzzyMatches(other: Array) -> Bool {
        let sortedSelf = self.sorted()
        let sortedOther = other.sorted()
        return sortedSelf == sortedOther
    }
}
