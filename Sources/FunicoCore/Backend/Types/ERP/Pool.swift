//
//  Pool.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

import Foundation

public enum Pool: CaseIterable {
    
    case finishedEndProducts
    case sprayedEndProducts
    case assembledItems
    case disassembledItems
    case ownManufactureProfiles
    case finishedSemiFinishedProducts
    case unfinishedSemiFinishedProducts
    case roughWood
    case productionIndicators
}

extension Pool: Sendable {}

extension Pool: APIEnum {
    
    public typealias CodableType = Int
    
    public init(id: String) throws {
        switch id {
        case "WUY4C4QXFU": self = .finishedEndProducts
        case "TH1QF8JRZC": self = .sprayedEndProducts
        case "PIN2ERCBTU": self = .assembledItems
        case "UUR313ROVQ": self = .disassembledItems
        case "GDNBY4O4P2": self = .ownManufactureProfiles
        case "M0CREP7OZM": self = .finishedSemiFinishedProducts
        case "JQD5XNNPJP": self = .unfinishedSemiFinishedProducts
        case "LNMSBZUZX8": self = .roughWood
        case "U14R0DOU9L": self = .productionIndicators
        default: throw APIEnumError.invalidId(id, apiEnum: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .finishedEndProducts: "WUY4C4QXFU"
        case .sprayedEndProducts: "TH1QF8JRZC"
        case .assembledItems: "PIN2ERCBTU"
        case .disassembledItems: "UUR313ROVQ"
        case .ownManufactureProfiles: "GDNBY4O4P2"
        case .finishedSemiFinishedProducts: "M0CREP7OZM"
        case .unfinishedSemiFinishedProducts: "JQD5XNNPJP"
        case .roughWood: "LNMSBZUZX8"
        case .productionIndicators: "U14R0DOU9L"
        }
    }
    
    public init(codable: Int) throws {
        switch codable {
        case 1: self = .finishedEndProducts
        case 2: self = .sprayedEndProducts
        case 3: self = .assembledItems
        case 4: self = .disassembledItems
        case 5: self = .ownManufactureProfiles
        case 6: self = .finishedSemiFinishedProducts
        case 7: self = .unfinishedSemiFinishedProducts
        case 8: self = .roughWood
        case 9: self = .productionIndicators
        default: throw APIEnumError.invalidCodable(codable, apiEnum: Self.self)
        }
    }
    public var codable: Int {
        switch self {
        case .finishedEndProducts: 1
        case .sprayedEndProducts: 2
        case .assembledItems: 3
        case .disassembledItems: 4
        case .ownManufactureProfiles: 5
        case .finishedSemiFinishedProducts: 6
        case .unfinishedSemiFinishedProducts: 7
        case .roughWood: 8
        case .productionIndicators: 9
        }
    }
}

extension Pool: Titleable {
    
    public var title: String {
        switch self {
        case .finishedEndProducts: String(localized: "Finished End Products", table: "Pool")
        case .sprayedEndProducts: String(localized: "Sprayed End Products", table: "Pool")
        case .assembledItems: String(localized: "Assembled Items", table: "Pool")
        case .disassembledItems: String(localized: "Disassembled Items", table: "Pool")
        case .ownManufactureProfiles: String(localized: "Own Manufacture Profiles", table: "Pool")
        case .finishedSemiFinishedProducts: String(localized: "Finished Semi-Finished Products", table: "Pool")
        case .unfinishedSemiFinishedProducts: String(localized: "Unfinished Semi-Finished Products", table: "Pool")
        case .roughWood: String(localized: "Rough Wood", table: "Pool")
        case .productionIndicators: String(localized: "Production Indicators", table: "Pool")
        }
    }
}

public extension Pool {
    
    var pool: Int {
        self.codable
    }
    
    init?(pool: Int?) {
        guard let pool else { return nil }
        try? self.init(codable: pool)
    }
}

extension Pool: Comparable, Strideable {
    
    public static func < (lhs: Pool, rhs: Pool) -> Bool {
        return lhs.pool < rhs.pool
    }
    
    public static func > (lhs: Pool, rhs: Pool) -> Bool {
        return lhs.pool > rhs.pool
    }
    
    public func advanced(by n: Int) -> Pool {
        var result = self.pool
        result += n
        return Pool(pool: result) ?? Pool.lowest
    }
    
    public func distance(to other: Pool) -> Int {
        return other.pool - self.pool
    }
}

public extension Pool {
    
    static let lowest: Self = Pool.finishedEndProducts
    static let highest: Self = Pool.productionIndicators
}
