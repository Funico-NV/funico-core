//
//  MaterialGroup.swift
//  Scheduler
//
//  Created by Damian van de Kauter on 13/03/2025.
//

import FunicoFoundation

public enum MaterialGroup {
    
    case METAL
    case PLASTIC
    case PRINT
    case SOLID
}

extension MaterialGroup: Sendable {}

extension MaterialGroup: CaseIterable {}

extension MaterialGroup: ERPCodeRepresentable {
    
    public init(id: String) throws {
        switch id {
        case "QW87YT59SE": self = .METAL
        case "AS4U5RPL56": self = .PLASTIC
        case "PL21DO5G4F": self = .PRINT
        case "KDI0S54OFR": self = .SOLID
        default: throw ERPCodeError<ERPCode, Self>.invalidId(id, type: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .METAL: "QW87YT59SE"
        case .PLASTIC: "AS4U5RPL56"
        case .PRINT: "PL21DO5G4F"
        case .SOLID: "KDI0S54OFR"
        }
    }
    
    public init(erpCode: String) throws {
        switch erpCode.uppercased() {
        case "METAL": self = .METAL
        case "PLASTIC": self = .PLASTIC
        case "PRINT": self = .PRINT
        case "SOLID": self = .SOLID
        default: throw ERPCodeError<ERPCode, Self>.invalidCode(erpCode, type: Self.self)
        }
    }
    public var erpCode: String {
        switch self {
        case .METAL: "METAL"
        case .PLASTIC: "PLASTIC"
        case .PRINT: "PRINT"
        case .SOLID: "SOLID"
        }
    }
}

extension MaterialGroup: Titleable {
    
    public var title: String {
        switch self {
        case .PLASTIC: String("Plastic")
        case .METAL: String("Metal")
        case .PRINT: String("Print")
        case .SOLID: String("Solid")
        }
    }
}
