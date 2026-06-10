//
//  PriceType.swift
//  Scheduler
//
//  Created by Damian Van de Kauter on 30/01/2025.
//

import FunicoFoundation

public enum PriceType {
    
    case inventory
    case purchase
    case sale
}

extension PriceType: Sendable {}

extension PriceType: ERPCodeRepresentable {
    
    public typealias ERPCode = Int
    
    public init(id: String) throws {
        switch id {
        case "B1YCQ2S5SA": self = .inventory
        case "OJZ3TE8RWN": self = .purchase
        case "KZ3E2TQ0QE": self = .sale
        default: throw ERPCodeError<ERPCode, Self>.invalidId(id, type: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .inventory: "B1YCQ2S5SA"
        case .purchase: "OJZ3TE8RWN"
        case .sale: "KZ3E2TQ0QE"
        }
    }
    
    public init(erpCode: Int) throws {
        switch erpCode {
        case 0: self = .inventory
        case 1: self = .purchase
        case 2: self = .sale
        default: throw ERPCodeError<ERPCode, Self>.invalidCode(erpCode, type: Self.self)
        }
    }
    public var erpCode: Int {
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
        case .inventory: String("Inventory")
        case .purchase: String("Purchase")
        case .sale: String("Sale")
        }
    }
}
