//
//  Part.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

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
    
    public init(apiValue: String) throws {
        switch apiValue.uppercased() {
        case "K": self = .head
        case "LD": self = .lthigh
        case "LS": self = .lshoulder
        case "RD": self = .rthigh
        case "RS": self = .rshoulder
        case "V": self = .foot
        default: throw APIEnumError.invalidApiValue(apiValue, apiEnum: Self.self)
        }
    }
    public var apiValue: String {
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
        case .head: String("Head")
        case .lthigh: String("Left Thigh")
        case .lshoulder: String("Left Shoulder")
        case .rthigh: String("Right Thigh")
        case .rshoulder: String("Right Shoulder")
        case .foot: String("Foot")
        }
    }
}

public extension Part {
    
    init?(reference: String?) {
        guard let reference else { return nil }
        switch reference.uppercased() {
        case "K": self = .head
        case "LD": self = .lthigh
        case "LS": self = .lshoulder
        case "RD": self = .rthigh
        case "RS": self = .rshoulder
        case "V": self = .foot
        default: return nil
        }
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
