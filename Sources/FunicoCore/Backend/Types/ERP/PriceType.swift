//
//  PriceType.swift
//  Scheduler
//
//  Created by Damian Van de Kauter on 30/01/2025.
//

public enum PriceType {
    
    case inventory
    case purchase
    case sale
}

extension PriceType: Sendable {}

extension PriceType: APIEnum {
    
    public typealias APIValue = Int
    
    public init(id: String) throws {
        switch id {
        case "B1YCQ2S5SA": self = .inventory
        case "OJZ3TE8RWN": self = .purchase
        case "KZ3E2TQ0QE": self = .sale
        default: throw APIEnumError.invalidId(id, apiEnum: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .inventory: "B1YCQ2S5SA"
        case .purchase: "OJZ3TE8RWN"
        case .sale: "KZ3E2TQ0QE"
        }
    }
    
    public init(apiValue: Int) throws {
        switch apiValue {
        case 0: self = .inventory
        case 1: self = .purchase
        case 2: self = .sale
        default: throw APIEnumError.invalidApiValue(apiValue, apiEnum: Self.self)
        }
    }
    public var apiValue: Int {
        switch self {
        case .inventory: 0
        case .purchase: 1
        case .sale: 2
        }
    }
}

extension PriceType: Titleable {
    
    public var title: String {
        switch self {
        case .inventory: String(localized: "Inventory", table: "PriceType")
        case .purchase: String(localized: "Purchase", table: "PriceType")
        case .sale: String(localized: "Sale", table: "PriceType")
        }
    }
}
