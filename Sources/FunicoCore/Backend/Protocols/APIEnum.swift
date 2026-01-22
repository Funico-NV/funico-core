//
//  APIEnum.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

public protocol APIEnum: RawRepresentable<String>, Codable, Identifiable<String>, Hashable, Sendable {
    
    associatedtype APIValue: Codable, Equatable, CustomStringConvertible
    
    init(id: String) throws
    init(apiValue: APIValue) throws
    
    var id: String { get }
    var apiValue: APIValue { get }
    
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
