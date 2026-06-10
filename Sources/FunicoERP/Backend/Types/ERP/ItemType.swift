//
//  ItemType.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 28/01/2025.
//

import FunicoFoundation

public enum ItemType {
    
    case item
    case bom
    case service
}

extension ItemType: Sendable {}

extension ItemType: CaseIterable {}

extension ItemType: ERPCodeRepresentable {
    
    public init(id: String) throws {
        switch id {
        case "T5I8JANGCE": self = .item
        case "WNCWB2NQEY": self = .bom
        case "KMIYM4E4VA": self = .service
        default: throw ERPCodeError<ERPCode, Self>.invalidId(id, type: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .item: "T5I8JANGCE"
        case .bom: "WNCWB2NQEY"
        case .service: "KMIYM4E4VA"
        }
    }
    
    public init(erpCode: Int) throws {
        switch erpCode {
        case 0: self = .item
        case 1: self = .bom
        case 2: self = .service
        default: throw ERPCodeError<ERPCode, Self>.invalidCode(erpCode, type: Self.self)
        }
    }
    public var erpCode: Int {
        switch self {
        case .item: 0
        case .bom: 1
        case .service: 2
        }
    }
}

extension ItemType: Titleable {
    
    public var title: String {
        switch self {
        case .item: String("Item")
        case .bom: String("Bom")
        case .service: String("Service")
        }
    }
}

public extension ItemType {
    
    var isOwnManufacture: Bool {
        switch self {
        case .bom:
            return true
        default:
            return false
        }
    }
}
