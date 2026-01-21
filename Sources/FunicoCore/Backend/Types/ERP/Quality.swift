//
//  Quality.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

import Foundation

public enum Quality: CaseIterable {
    
    case A
    case B
    case C
    
    case RA
    case RB
    case RC
    
    case AD
    case AK
    case BD
    case BK
}

extension Quality: Sendable {}

extension Quality: APIEnum {
    
    public typealias CodableType = String
    
    public init(id: String) throws {
        switch id {
        case "PWZ7D3T3D1": self = .A
        case "INAAKOS3AC": self = .B
        case "AM6ZKIHFGU": self = .C
        case "PGWDFINAQZ": self = .RA
        case "LDAKQHH6EI": self = .RB
        case "U9AX0X3R1V": self = .RC
        case "SHK7JU4ZIM": self = .AD
        case "Q2ESWI7NTS": self = .AK
        case "K3OO0RLXM9": self = .BD
        case "J7WPQ554XR": self = .BK
        default: throw APIEnumError.invalidId(id, apiEnum: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .A: "PWZ7D3T3D1"
        case .B: "INAAKOS3AC"
        case .C: "AM6ZKIHFGU"
        case .RA: "PGWDFINAQZ"
        case .RB: "LDAKQHH6EI"
        case .RC: "U9AX0X3R1V"
        case .AD: "SHK7JU4ZIM"
        case .AK: "Q2ESWI7NTS"
        case .BD: "K3OO0RLXM9"
        case .BK: "J7WPQ554XR"
        }
    }
    
    public init(codable: String) throws {
        switch codable {
        case "A": self = .A
        case "B": self = .B
        case "C": self = .C
        case "RA": self = .RA
        case "RB": self = .RB
        case "RC": self = .RC
        case "AD": self = .AD
        case "AK": self = .AK
        case "BD": self = .BD
        case "BK": self = .BK
        default: throw APIEnumError.invalidCodable(codable, apiEnum: Self.self)
        }
    }
    public var codable: String {
        switch self {
        case .A: "A"
        case .B: "B"
        case .C: "C"
        case .RA: "RA"
        case .RB: "RB"
        case .RC: "RC"
        case .AD: "AD"
        case .AK: "AK"
        case .BD: "BD"
        case .BK: "BK"
        }
    }
}

extension Quality: Titleable {
    
    public var title: String {
        switch self {
        case .A: "A"
        case .B: "B"
        case .C: "C"
        case .RA: "RA"
        case .RB: "RB"
        case .RC: "RC"
        case .AD: "AD"
        case .AK: "AK"
        case .BD: "BD"
        case .BK: "BK"
        }
    }
}

public extension Quality {
    
    init?(reference: String?) {
        guard let reference else { return nil }
        switch reference.uppercased() {
        case "A": self = .A
        case "B": self = .B
        case "C": self = .C
        case "RA": self = .RA
        case "RB": self = .RB
        case "RC": self = .RC
        case "AD": self = .AD
        case "AK": self = .AK
        case "BD": self = .BD
        case "BK": self = .BK
        default: return nil
        }
    }
    
    /// An uppercase reference of the `Quality`.
    var reference: String {
        switch self {
        case .A: "A"
        case .B: "B"
        case .C: "C"
        case .RA: "RA"
        case .RB: "RB"
        case .RC: "RC"
        case .AD: "AD"
        case .AK: "AK"
        case .BD: "BD"
        case .BK: "BK"
        }
    }
}

public extension Quality {
    
    var lower: Quality? {
        switch self {
        case .A: .B
        case .B: .C
        case .C: .C
        case .RA: .RB
        case .RB: .RC
        case .RC: .RC
        case .AD: .BD
        case .AK: .BK
        case .BD: .BD
        case .BK: .BK
        }
    }
    
    var higher: Quality? {
        switch self {
        case .A: .A
        case .B: .A
        case .C: .B
        case .RA: .RA
        case .RB: .RA
        case .RC: .RB
        case .AD: .AD
        case .AK: .AK
        case .BD: .AD
        case .BK: .AK
        }
    }
}
