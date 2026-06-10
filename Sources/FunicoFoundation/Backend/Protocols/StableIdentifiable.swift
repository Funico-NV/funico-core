//
//  StableIdentifiable.swift
//  funico-core
//
//  Created by Codex on 10/06/2026.
//

public protocol StableIdentifiable: Identifiable<String>, Hashable, Sendable {
    
    init(id: String) throws
    
    var id: String { get }
}

