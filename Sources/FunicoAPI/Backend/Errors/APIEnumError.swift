//
//  APIEnumError.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

import Foundation

public enum APIEnumError<APIValue: Codable & Equatable & CustomStringConvertible & Sendable, T: APIValueRepresentable>: Error {
    
    case invalidId(_ id: APIValue, apiEnum: T.Type)
    case invalidApiValue(_ apiValue: APIValue, apiEnum: T.Type)
}

extension APIEnumError: LocalizedError {
    
    public var errorCode: Int {
        switch self {
        case .invalidId: 1
        case .invalidApiValue: 2
        }
    }
    
    public var errorDescription: String? {
        switch self {
        case .invalidId(let id, let apiEnum):
            "The id '\(id.description)' is invalid for the enum '\(String(describing: apiEnum))'."
        case .invalidApiValue(let apiValue, let apiEnum):
            "The apiValue '\(apiValue.description)' is invalid for the enum '\(String(describing: apiEnum))'."
        }
    }
}
