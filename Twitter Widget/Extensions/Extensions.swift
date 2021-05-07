//
//  Extensions.swift
//  Twitter
//
//  Created by cole cabral on 2021-05-07.
//

import Foundation

extension Int {
    var abbreviated: String {
        let abbreviation = "KMBTPE"
        return abbreviation.enumerated().reversed().reduce(nil as String?) { accum, tuple in
            let factor = Double(self) / pow(10, Double(tuple.0 + 1) * 3)
            let format = (factor.truncatingRemainder(dividingBy: 1)  == 0 ? "%.0f%@" : "%.1f%@")
            return accum ?? (factor > 1 ? String(format: format, factor, String(tuple.1)) : nil)
            } ?? String(self)
    }
}
