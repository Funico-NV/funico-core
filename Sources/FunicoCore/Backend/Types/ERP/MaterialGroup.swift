//
//  MaterialGroup.swift
//  Scheduler
//
//  Created by Damian van de Kauter on 13/03/2025.
//

public enum MaterialGroup {
    
    case METAL
    case PLASTIC
    case PRINT
    case SOLID
}

extension MaterialGroup: Sendable {}

extension MaterialGroup: CaseIterable {}

extension MaterialGroup: APIEnum {
    
    public init(id: String) throws {
        switch id {
        case "QW87YT59SE": self = .METAL
        case "AS4U5RPL56": self = .PLASTIC
        case "PL21DO5G4F": self = .PRINT
        case "KDI0S54OFR": self = .SOLID
        default: throw APIEnumError.invalidId(id, apiEnum: Self.self)
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
    
    public init(apiValue: String) throws {
        switch apiValue {
        case "METAL": self = .METAL
        case "PLASTIC": self = .PLASTIC
        case "PRINT": self = .PRINT
        case "SOLID": self = .SOLID
        default: throw APIEnumError.invalidApiValue(apiValue, apiEnum: Self.self)
        }
    }
    public var apiValue: String {
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
        case .PLASTIC: String(localized: "Plastic")
        case .METAL: String(localized: "Metal")
        case .PRINT: String(localized: "Print")
        case .SOLID: String(localized: "Solid")
        }
    }
}
