//
//  Warehouse.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 04/12/2023.
//

public enum Warehouse {
    
    case DEM
    case FUN
    case LOT
    case STEP
}

extension Warehouse: Sendable {}

extension Warehouse: CaseIterable {}

extension Warehouse: APIEnum {
    
    public init(id: String) throws {
        switch id {
        case "HJNQQV0GP0": self = .DEM
        case "J17BWQ2EGR": self = .FUN
        case "WEXFS8FMU4": self = .LOT
        case "V6IT6FPMW4": self = .STEP
        default: throw APIEnumError.invalidId(id, apiEnum: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .DEM: "HJNQQV0GP0"
        case .FUN: "J17BWQ2EGR"
        case .LOT: "WEXFS8FMU4"
        case .STEP: "V6IT6FPMW4"
        }
    }
    
    public init(apiValue: String) throws {
        switch apiValue.uppercased() {
        case "DEM": self = .DEM
        case "FUN": self = .FUN
        case "LOT": self = .LOT
        case "STEP": self = .STEP
        default: throw APIEnumError.invalidApiValue(apiValue, apiEnum: Self.self)
        }
    }
    public var apiValue: String {
        switch self {
        case .DEM: "DEM"
        case .FUN: "FUN"
        case .LOT: "LOT"
        case .STEP: "STEP"
        }
    }
}

extension Warehouse: Titleable {
    
    public var title: String {
        switch self {
        case .DEM: String(localized: "DEM")
        case .FUN: String(localized: "FUN")
        case .LOT: String(localized: "LOT")
        case .STEP: String(localized: "STEP")
        }
    }
}
