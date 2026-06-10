//
//  OrderStatus.swift
//  funico-scheduler-api-server
//
//  Created by Damian Van de Kauter on 26/12/2025.
//

import FunicoFoundation

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

extension OrderStatus: ERPCodeRepresentable {
    
    public typealias ERPCode = Int
    
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
        default: throw ERPCodeError<ERPCode, Self>.invalidId(id, type: Self.self)
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
    
    public init(erpCode: Int) throws {
        switch erpCode {
        case 0: self = .created
        case 1: self = .estimated
        case 2: self = .planned
        case 3: self = .released
        case 4: self = .started
        case 5: self = .completed
        case 6: self = .calculated
        case 7: self = .terminated
        default: throw ERPCodeError<ERPCode, Self>.invalidCode(erpCode, type: Self.self)
        }
    }
    public var erpCode: Int {
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

extension OrderStatus {
    
    public init?(status: Int) {
        switch status {
        case 0: self = .created
        case 1: self = .estimated
        case 2: self = .planned
        case 3: self = .released
        case 4: self = .started
        case 5: self = .completed
        case 6: self = .calculated
        case 7: self = .terminated
        default: return nil
        }
    }
    public var status: Int {
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
        case .created: String("Created")
        case .estimated: String("Estimated")
        case .planned: String("Planned")
        case .released: String("Released")
        case .started: String("Started")
        case .completed: String("Completed")
        case .calculated: String("Calculated")
        case .terminated: String("Terminated")
        }
    }
}
