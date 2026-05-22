//
//  Pool.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

public enum Pool {
    
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

extension Pool: CaseIterable {}

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

extension Pool: APIEnum {
    
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
    
    public init(apiValue: Int) throws {
        switch apiValue {
        case 1: self = .finishedEndProducts
        case 2: self = .sprayedEndProducts
        case 3: self = .assembledItems
        case 4: self = .disassembledItems
        case 5: self = .ownManufactureProfiles
        case 6: self = .finishedSemiFinishedProducts
        case 7: self = .unfinishedSemiFinishedProducts
        case 8: self = .roughWood
        case 9: self = .productionIndicators
        default: throw APIEnumError.invalidApiValue(apiValue, apiEnum: Self.self)
        }
    }
    public var apiValue: Int {
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
        case .finishedEndProducts: String("Finished End Products")
        case .sprayedEndProducts: String("Sprayed End Products")
        case .assembledItems: String("Assembled Items")
        case .disassembledItems: String("Disassembled Items")
        case .ownManufactureProfiles: String("Own Manufacture Profiles")
        case .finishedSemiFinishedProducts: String("Finished Semi-Finished Products")
        case .unfinishedSemiFinishedProducts: String("Unfinished Semi-Finished Products")
        case .roughWood: String("Rough Wood")
        case .productionIndicators: String("Production Indicators")
        }
    }
}

public extension Pool {
    
    var pool: Int {
        self.apiValue
    }
    
    init?(pool: Int?) {
        guard let pool else { return nil }
        try? self.init(apiValue: pool)
    }
}

public extension Pool {
    
    static let lowest: Self = Pool.finishedEndProducts
    static let highest: Self = Pool.productionIndicators
}

public extension Pool {
    
    var isEndProduct: Bool {
        switch self {
        case .finishedEndProducts, .sprayedEndProducts:
            return true
        default:
            return false
        }
    }
}
