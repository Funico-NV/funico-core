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
    case other(String)
}

extension Warehouse: Sendable {}

extension Warehouse: CaseIterable {
    
    public static var allCases: [Warehouse] {
        [.DEM, .FUN, .LOT, .STEP]
    }
}

extension Warehouse: APIEnum {
    
    public init(id: String) throws {
        switch id {
        case "HJNQQV0GP0": self = .DEM
        case "J17BWQ2EGR": self = .FUN
        case "WEXFS8FMU4": self = .LOT
        case "V6IT6FPMW4": self = .STEP
        default:
            if id.hasPrefix("PSR77UXPNT-") {
                let warehouse = String(id.dropFirst("PSR77UXPNT-".count))
                guard !warehouse.isEmpty else { throw APIEnumError.invalidId(id, apiEnum: Self.self) }
                self = .other(warehouse)
            } else {
                throw APIEnumError.invalidId(id, apiEnum: Self.self)
            }
        }
    }
    public var id: String {
        switch self {
        case .DEM: "HJNQQV0GP0"
        case .FUN: "J17BWQ2EGR"
        case .LOT: "WEXFS8FMU4"
        case .STEP: "V6IT6FPMW4"
        case .other(let warehouse): "PSR77UXPNT-\(warehouse)"
        }
    }
    
    public init(apiValue: String) throws {
        switch apiValue.uppercased() {
        case "DEM": self = .DEM
        case "FUN": self = .FUN
        case "LOT": self = .LOT
        case "STEP": self = .STEP
        default:
            guard !apiValue.isEmpty else { throw APIEnumError.invalidApiValue(apiValue, apiEnum: Self.self) }
            self = .other(apiValue)
        }
    }
    public var apiValue: String {
        switch self {
        case .DEM: "DEM"
        case .FUN: "FUN"
        case .LOT: "LOT"
        case .STEP: "STEP"
        case .other(let warehouse): warehouse
        }
    }
}

extension Warehouse: Titleable {
    
    public var title: String {
        switch self {
        case .DEM: String("DEM")
        case .FUN: String("FUN")
        case .LOT: String("LOT")
        case .STEP: String("STEP")
        case .other(let warehouse): warehouse
        }
    }
}
