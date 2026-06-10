//
//  BomType.swift
//  Funico Scheduler
//
//  Created by Damian Van de Kauter on 27/03/2024.
//

import FunicoFoundation

public enum BomType {
    
    case item
    case phantom
    case production
    case supplier
}

extension BomType: Sendable {}

extension BomType: ERPCodeRepresentable {
    
    public typealias ERPCode = Int
    
    public init(id: String) throws {
        switch id {
        case "QSDX1U9XAG": self = .item
        case "CXE638UC18": self = .phantom
        case "I4Y7S9RDE2": self = .production
        case "MDJ18T88TE": self = .supplier
        default: throw ERPCodeError<ERPCode, Self>.invalidId(id, type: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .item: "QSDX1U9XAG"
        case .phantom: "CXE638UC18"
        case .production: "I4Y7S9RDE2"
        case .supplier: "MDJ18T88TE"
        }
    }
    
    public init(erpCode: Int) throws {
        switch erpCode {
        case 0: self = .item
        case 1: self = .phantom
        case 2: self = .production
        case 3: self = .supplier
        default: throw ERPCodeError<ERPCode, Self>.invalidCode(erpCode, type: Self.self)
        }
    }
    public var erpCode: Int {
        switch self {
        case .item: 0
        case .phantom: 1
        case .production: 2
        case .supplier: 3
        }
    }
}

extension BomType: Titleable {
    
    public var title: String {
        switch self {
        case .item: String("Item")
        case .phantom: String("Phantom")
        case .production: String("Production")
        case .supplier: String("Supplier")
        }
    }
}

public extension BomType {
    
    var isPhantom: Bool {
        switch self {
        case .phantom: true
        default: false
        }
    }
}
