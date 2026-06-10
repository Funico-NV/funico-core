//
//  APIEnum.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

public protocol APIValueRepresentable: Codable, Sendable {
    
    associatedtype APIValue: Codable, Equatable, CustomStringConvertible
    
    init(apiValue: APIValue) throws
    
    var apiValue: APIValue { get }
}

@available(*, deprecated, renamed: "APIValueRepresentable")
public typealias APIEnum = APIValueRepresentable
