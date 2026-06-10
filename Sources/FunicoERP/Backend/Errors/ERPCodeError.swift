//
//  ERPCodeError.swift
//  funico-core
//
//  Created by Codex on 10/06/2026.
//

import Foundation

public enum ERPCodeError<Code: Codable & Equatable & CustomStringConvertible & Sendable, T>: Error {
    
    case invalidId(_ id: String, type: T.Type)
    case invalidCode(_ code: Code, type: T.Type)
}

extension ERPCodeError: LocalizedError {
    
    public var errorCode: Int {
        switch self {
        case .invalidId: 1
        case .invalidCode: 2
        }
    }
    
    public var errorDescription: String? {
        switch self {
        case .invalidId(let id, let type):
            "The id '\(id)' is invalid for the type '\(String(describing: type))'."
        case .invalidCode(let code, let type):
            "The ERP code '\(code.description)' is invalid for the type '\(String(describing: type))'."
        }
    }
}

