//
//  APIEnum.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

public protocol APIEnum: RawRepresentable<String>, Codable, Identifiable<String>, Hashable, Sendable {
    
    associatedtype CodableType: Codable, Equatable, CustomStringConvertible
    
    init(id: String) throws
    init(codable: CodableType) throws
    
    var id: String { get }
    var codable: CodableType { get }
    
    var rawValue: String { get }
    init?(rawValue: String)
}

public extension APIEnum {
    
    var rawValue: String {
        return self.id
    }
    
    init?(rawValue: String) {
        guard let idInit = try? Self.init(id: rawValue) else { return nil }
        self = idInit
    }
}
