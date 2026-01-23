//
//  SalesStatus.swift
//  Scheduler
//
//  Created by Damian Van de Kauter on 30/11/2024.
//

public enum SalesStatus {
    
    case pending
    case delivered
    case invoiced
    case cancelled
}

extension SalesStatus: Sendable {}

extension SalesStatus: Comparable, Equatable {
    
    public static func < (lhs: SalesStatus, rhs: SalesStatus) -> Bool {
        return lhs.status < rhs.status
    }
    
    public static func > (lhs: SalesStatus, rhs: SalesStatus) -> Bool {
        return lhs.status > rhs.status
    }
}

extension SalesStatus: APIEnum {
    
    public typealias APIValue = Int
    
    public init(id: String) throws {
        switch id {
        case "KVG2NB1LKS": self = .pending
        case "VP6WBCQRK9": self = .delivered
        case "W7DRZ6XI6K": self = .invoiced
        case "IVNMYGT0DD": self = .cancelled
        default: throw APIEnumError.invalidId(id, apiEnum: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .pending: "KVG2NB1LKS"
        case .delivered: "VP6WBCQRK9"
        case .invoiced: "W7DRZ6XI6K"
        case .cancelled: "IVNMYGT0DD"
        }
    }
    
    public init(apiValue: Int) throws {
        switch apiValue {
        case 1: self = .pending
        case 2: self = .delivered
        case 3: self = .invoiced
        case 4: self = .cancelled
        default: throw APIEnumError.invalidApiValue(apiValue, apiEnum: Self.self)
        }
    }
    public var apiValue: Int {
        switch self {
        case .pending: 1
        case .delivered: 2
        case .invoiced: 3
        case .cancelled: 4
        }
    }
}

extension SalesStatus: Titleable {
    
    public var title: String {
        switch self {
        case .pending: String(localized: "Pending")
        case .delivered: String(localized: "Delivered")
        case .invoiced: String(localized: "Invoiced")
        case .cancelled: String(localized: "Cancelled")
        }
    }
}

public extension SalesStatus {
    
    var status: Int {
        switch self {
        case .pending: 1
        case .delivered: 2
        case .invoiced: 3
        case .cancelled: 4
        }
    }
}
