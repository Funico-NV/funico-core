//
//  Part.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

import Foundation

public enum Part: CaseIterable {
    
    case head
    case lthigh
    case lshoulder
    case rthigh
    case rshoulder
    case foot
}

extension Part: Sendable {}

extension Part: APIEnum {
    
    public typealias CodableType = String
    
    public init(id: String) throws {
        switch id {
        case "GGOYCGCPAT": self = .head
        case "HKIGOQYMHM": self = .lthigh
        case "QWTHJ04TJE": self = .lshoulder
        case "P0BKSIA5YE": self = .rthigh
        case "K8KECLJKV5": self = .rshoulder
        case "L1N6Y4EH88": self = .foot
        default: throw APIEnumError.invalidId(id, apiEnum: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .head: "GGOYCGCPAT"
        case .lthigh: "HKIGOQYMHM"
        case .lshoulder: "QWTHJ04TJE"
        case .rthigh: "P0BKSIA5YE"
        case .rshoulder: "K8KECLJKV5"
        case .foot: "L1N6Y4EH88"
        }
    }
    
    public init(codable: String) throws {
        switch codable {
        case "K": self = .head
        case "LD": self = .lthigh
        case "LS": self = .lshoulder
        case "RD": self = .rthigh
        case "RS": self = .rshoulder
        case "V": self = .foot
        default: throw APIEnumError.invalidCodable(codable, apiEnum: Self.self)
        }
    }
    public var codable: String {
        switch self {
        case .head: "K"
        case .lthigh: "LD"
        case .lshoulder: "LS"
        case .rthigh: "RD"
        case .rshoulder: "RS"
        case .foot: "V"
        }
    }
}

extension Part: Titleable {
    
    public var title: String {
        switch self {
        case .head: String(localized: "Head", table: "Part")
        case .lthigh: String(localized: "Left Thigh", table: "Part")
        case .lshoulder: String(localized: "Left Shoulder", table: "Part")
        case .rthigh: String(localized: "Right Thigh", table: "Part")
        case .rshoulder: String(localized: "Right Shoulder", table: "Part")
        case .foot: String(localized: "Foot", table: "Part")
        }
    }
}

public extension Part {
    
    init?(reference: String?) {
        guard let reference else { return nil }
        guard let firstReferenceMatch = Self.allCases.first(where: { $0.reference == reference }) else { return nil }
        
        self = firstReferenceMatch
    }
    
    /// An uppercase reference of the `Part`.
    var reference: String {
        switch self {
        case .head: "K"
        case .lthigh: "LD"
        case .lshoulder: "LS"
        case .rthigh: "RD"
        case .rshoulder: "RS"
        case .foot: "V"
        }
    }
}

public extension Part {
    
    var nameReference: String {
        switch self {
        case .head: "KOP"
        case .lthigh: "LDIJ"
        case .lshoulder: "LSCH"
        case .rthigh: "RDIJ"
        case .rshoulder: "RSCH"
        case .foot: "VOET"
        }
    }
}
