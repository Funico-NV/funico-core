//
//  ERPCodeRepresentable.swift
//  funico-core
//
//  Created by Codex on 10/06/2026.
//

import FunicoFoundation

public protocol ERPCodeRepresentable: StableRawRepresentable, Codable {
    
    associatedtype ERPCode: Codable & Equatable & CustomStringConvertible & Sendable
    
    init(erpCode: ERPCode) throws
    
    var erpCode: ERPCode { get }
}

public extension ERPCodeRepresentable {
    
    @available(*, deprecated, renamed: "ERPCode")
    typealias APIValue = ERPCode
    
    @available(*, deprecated, renamed: "init(erpCode:)")
    init(apiValue: ERPCode) throws {
        try self.init(erpCode: apiValue)
    }
    
    @available(*, deprecated, renamed: "erpCode")
    var apiValue: ERPCode {
        return self.erpCode
    }
}
