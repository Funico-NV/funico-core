//
//  SalesStatus.swift
//  Scheduler
//
//  Created by Damian Van de Kauter on 30/11/2024.
//

import FunicoFoundation

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

extension SalesStatus: ERPCodeRepresentable {
    
    public typealias ERPCode = Int
    
    public init(id: String) throws {
        switch id {
        case "KVG2NB1LKS": self = .pending
        case "VP6WBCQRK9": self = .delivered
        case "W7DRZ6XI6K": self = .invoiced
        case "IVNMYGT0DD": self = .cancelled
        default: throw ERPCodeError<ERPCode, Self>.invalidId(id, type: Self.self)
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
    
    public init(erpCode: Int) throws {
        switch erpCode {
        case 1: self = .pending
        case 2: self = .delivered
        case 3: self = .invoiced
        case 4: self = .cancelled
        default: throw ERPCodeError<ERPCode, Self>.invalidCode(erpCode, type: Self.self)
        }
    }
    public var erpCode: Int {
        switch self {
        case .pending: 1
        case .delivered: 2
        case .invoiced: 3
        case .cancelled: 4
        }
    }
}

extension SalesStatus {
    
    public init?(status: Int) {
        switch status {
        case 1: self = .pending
        case 2: self = .delivered
        case 3: self = .invoiced
        case 4: self = .cancelled
        default: return nil
        }
    }
    public var status: Int {
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
        case .pending: String("Pending")
        case .delivered: String("Delivered")
        case .invoiced: String("Invoiced")
        case .cancelled: String("Cancelled")
        }
    }
}
