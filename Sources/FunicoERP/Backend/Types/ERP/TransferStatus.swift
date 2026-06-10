//
//  TransferStatus.swift
//  funico-scheduler-api-server
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

import FunicoFoundation

public enum TransferStatus {
    
    case created
    case shipped
    case delivered
}

extension TransferStatus: Sendable {}

extension TransferStatus: Comparable, Equatable {
    
    public static func < (lhs: TransferStatus, rhs: TransferStatus) -> Bool {
        return lhs.status < rhs.status
    }
    
    public static func > (lhs: TransferStatus, rhs: TransferStatus) -> Bool {
        return lhs.status > rhs.status
    }
}

extension TransferStatus: ERPCodeRepresentable {
    
    public typealias ERPCode = Int
    
    public init(id: String) throws {
        switch id {
        case "KFH567QVQP": self = .created
        case "RH7654321Q": self = .shipped
        case "T54321QWER": self = .delivered
        default: throw ERPCodeError<ERPCode, Self>.invalidId(id, type: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .created: "KFH567QVQP"
        case .shipped: "RH7654321Q"
        case .delivered: "T54321QWER"
        }
    }
    
    public init(erpCode: Int) throws {
        switch erpCode {
        case 0: self = .created
        case 1: self = .shipped
        case 2: self = .delivered
        default: throw ERPCodeError<ERPCode, Self>.invalidCode(erpCode, type: Self.self)
        }
    }
    public var erpCode: Int {
        switch self {
        case .created: 0
        case .shipped: 1
        case .delivered: 2
        }
    }
}

extension TransferStatus {
    
    public init?(status: Int) {
        switch status {
        case 0: self = .created
        case 1: self = .shipped
        case 2: self = .delivered
        default: return nil
        }
    }
    public var status: Int {
        switch self {
        case .created: 0
        case .shipped: 1
        case .delivered: 2
        }
    }
}

extension TransferStatus: Titleable {
    
    public var title: String {
        switch self {
        case .created: String("Created")
        case .shipped: String("Shipped")
        case .delivered: String("Delivered")
        }
    }
}
