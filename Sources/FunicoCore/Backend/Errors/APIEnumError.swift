//
//  APIEnumError.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

import Foundation

public enum APIEnumError<CodableType: Codable & Equatable & CustomStringConvertible & Sendable, T: APIEnum>: Error {
    
    case invalidId(_ id: CodableType, apiEnum: T.Type)
    case invalidCodable(_ codable: CodableType, apiEnum: T.Type)
}

extension APIEnumError: LocalizedError {
    
    public var errorCode: Int {
        switch self {
        case .invalidId: 1
        case .invalidCodable: 2
        }
    }
    
    public var errorDescription: String? {
        switch self {
        case .invalidId(let id, let apiEnum):
            "The id '\(id.description)' is invalid for the enum '\(String(describing: apiEnum))'."
        case .invalidCodable(let codable, let apiEnum):
            "The codable '\(codable.description)' is invalid for the enum '\(String(describing: apiEnum))'."
        }
    }
}
