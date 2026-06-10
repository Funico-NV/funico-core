//
//  StableRawRepresentable.swift
//  funico-core
//
//  Created by Codex on 10/06/2026.
//

public protocol StableRawRepresentable: StableIdentifiable, RawRepresentable<String> {}

public extension StableRawRepresentable {
    
    var rawValue: String {
        return self.id
    }
    
    init?(rawValue: String) {
        guard let idInit = try? Self.init(id: rawValue) else { return nil }
        self = idInit
    }
}

