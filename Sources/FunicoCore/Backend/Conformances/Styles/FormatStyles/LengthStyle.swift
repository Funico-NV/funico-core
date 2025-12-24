//
//  LengthStyle.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

import Foundation

public struct LengthStyle: FormatStyle {
    
    public func format(_ value: Stock) -> String {
        return value.formatted(
            .number
            .precision(.integerAndFractionLength(integerLimits: 1..., fractionLimits: 0...0))
            .grouping(.never)
        )
    }
}

public extension FormatStyle where Self == LengthStyle {
    
    static var length: Self {
        LengthStyle()
    }
}
