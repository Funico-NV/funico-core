//
//  OrderStatus.swift
//  funico-scheduler-api-server
//
//  Created by Damian Van de Kauter on 26/12/2025.
//

public enum OrderStatus {
    
    case created
    case estimated
    case planned
    case released
    case started
    case completed
    case calculated
    case terminated
}

extension OrderStatus: Sendable {}

extension OrderStatus: CaseIterable {}

extension OrderStatus: Comparable, Equatable {
    
    public static func < (lhs: OrderStatus, rhs: OrderStatus) -> Bool {
        return lhs.status < rhs.status
    }
    
    public static func > (lhs: OrderStatus, rhs: OrderStatus) -> Bool {
        return lhs.status > rhs.status
    }
}

extension OrderStatus: APIEnum {
    
    public typealias APIValue = Int
    
    public init(id: String) throws {
        switch id {
        case "EBWD9904KE": self = .created
        case "LGK5dL8Z71": self = .estimated
        case "Y8CQ8F7Z08": self = .planned
        case "TS114P4D0I": self = .released
        case "XV3CMMRD24": self = .started
        case "HNABGPRJ7F": self = .completed
        case "WZGM05OF2I": self = .calculated
        case "AUW7T8QXUW": self = .terminated
        default: throw APIEnumError.invalidId(id, apiEnum: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .created: "EBWD9904KE"
        case .estimated: "LGK5dL8Z71"
        case .planned: "Y8CQ8F7Z08"
        case .released: "TS114P4D0I"
        case .started: "XV3CMMRD24"
        case .completed: "HNABGPRJ7F"
        case .calculated: "WZGM05OF2I"
        case .terminated: "AUW7T8QXUW"
        }
    }
    
    public init(apiValue: Int) throws {
        switch apiValue {
        case 0: self = .created
        case 1: self = .estimated
        case 2: self = .planned
        case 3: self = .released
        case 4: self = .started
        case 5: self = .completed
        case 6: self = .calculated
        case 7: self = .terminated
        default: throw APIEnumError.invalidApiValue(apiValue, apiEnum: Self.self)
        }
    }
    public var apiValue: Int {
        switch self {
        case .created: 0
        case .estimated: 1
        case .planned: 2
        case .released: 3
        case .started: 4
        case .completed: 5
        case .calculated: 6
        case .terminated: 7
        }
    }
}

extension OrderStatus: Titleable {
    
    public var title: String {
        switch self {
        case .created: String(localized: "Created", table: "OrderStatus")
        case .estimated: String(localized: "Estimated", table: "OrderStatus")
        case .planned: String(localized: "Planned", table: "OrderStatus")
        case .released: String(localized: "Released", table: "OrderStatus")
        case .started: String(localized: "Started", table: "OrderStatus")
        case .completed: String(localized: "Completed", table: "OrderStatus")
        case .calculated: String(localized: "Calculated", table: "OrderStatus")
        case .terminated: String(localized: "Terminated", table: "OrderStatus")
        }
    }
}

public extension OrderStatus {
    
    var status: Int {
        switch self {
        case .created: 0
        case .estimated: 1
        case .planned: 2
        case .released: 3
        case .started: 4
        case .completed: 5
        case .calculated: 6
        case .terminated: 7
        }
    }
}
