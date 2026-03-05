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
    
    case customer(String, warehouse: String)
    case returns(String, warehouse: String)
    case transit(String, warehouse: String)
    case quarantine(String, warehouse: String)
    
    case name(warehouse: String)
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
            if id.hasPrefix("MBQEKWPE7L-") {
                let warehouse = String(id.dropFirst("MBQEKWPE7L-".count))
                guard let customerId = warehouse.customerId else { throw APIEnumError.invalidId(id, apiEnum: Self.self) }
                self = .customer(customerId, warehouse: warehouse)
            }
            if id.hasPrefix("FH5XJIW63D-") {
                let warehouse = String(id.dropFirst("FH5XJIW63D-".count))
                guard !warehouse.isEmpty else { throw APIEnumError.invalidId(id, apiEnum: Self.self) }
                self = .returns(<#T##String#>, warehouse: warehouse)
            } else
            if id.hasPrefix("Q2AXL6AQIH-") {
                let warehouse = String(id.dropFirst("Q2AXL6AQIH-".count))
                guard !warehouse.isEmpty else { throw APIEnumError.invalidId(id, apiEnum: Self.self) }
                self = .transit(<#T##String#>, warehouse: warehouse)
            }
            if id.hasPrefix("KOP7IPUEMZ-") {
                let warehouse = String(id.dropFirst("KOP7IPUEMZ-".count))
                guard !warehouse.isEmpty else { throw APIEnumError.invalidId(id, apiEnum: Self.self) }
                self = .quarantine(<#T##String#>, warehouse: warehouse)
            }
            if id.hasPrefix("PSR77UXPNT-") {
                let warehouse = String(id.dropFirst("PSR77UXPNT-".count))
                guard !warehouse.isEmpty else { throw APIEnumError.invalidId(id, apiEnum: Self.self) }
                self = .name(warehouse: warehouse)
            }
            
            throw APIEnumError.invalidId(id, apiEnum: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .DEM: "HJNQQV0GP0"
        case .FUN: "J17BWQ2EGR"
        case .LOT: "WEXFS8FMU4"
        case .STEP: "V6IT6FPMW4"
            
        case .customer(_, let warehouse): "MBQEKWPE7L-\(warehouse)"
        case .returns(_, let warehouse): "FH5XJIW63D-\(warehouse)"
        case .transit(_, let warehouse): "Q2AXL6AQIH-\(warehouse)"
        case .quarantine(_, let warehouse): "KOP7IPUEMZ-\(warehouse)"
            
        case .name(let warehouse): "PSR77UXPNT-\(warehouse)"
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
            
            if let customerId = apiValue.customerId {
                self = .customer(customerId, warehouse: apiValue)
            }
            if let returnsWarehouse = apiValue.returnsWarehouse {
                self = .returns(returnsWarehouse, warehouse: apiValue)
            }
            if let transitWarehouse = apiValue.transitWarehouse {
                self = .transit(transitWarehouse, warehouse: apiValue)
            }
            if let quarantineWarehouse = apiValue.quarantineWarehouse {
                self = .quarantine(quarantineWarehouse, warehouse: apiValue)
            }
            
            self = .name(warehouse: apiValue)
        }
    }
    public var apiValue: String {
        switch self {
        case .DEM: "DEM"
        case .FUN: "FUN"
        case .LOT: "LOT"
        case .STEP: "STEP"
            
        case .customer(let customerId, let warehouse): warehouse
        case .returns(let returnsWarehouse, let warehouse): warehouse
        case .transit(let transitWarehouse, let warehouse): warehouse
        case .quarantine(let quarantineWarehouse, let warehouse): warehouse
            
        case .name(let warehouse): warehouse
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
            
        case .customer(let customerId, let warehouse): warehouse
        case .returns(let returnsWarehouse, let warehouse): warehouse
        case .transit(let transitWarehouse, let warehouse): warehouse
        case .quarantine(let quarantineWarehouse, let warehouse): warehouse
            
        case .name(let warehouse): warehouse
        }
    }
}

fileprivate extension String {
    
    var customerId: String? {
        let customer = self.trimmingPrefix("KK").trimmingPrefix("K")
        guard self.uppercased().hasPrefix("K"), customer.allSatisfy({ $0.isNumber })
        else { return nil }
        
        return String(customer)
    }
    
    var returnsWarehouse: String? {
        
    }
    
    var transitWarehouse: String? {
        
    }
    
    var quarantineWarehouse: String? {
        
    }
}
