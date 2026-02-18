//
//  ManufactureLevel.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

public enum ManufactureLevel {
    
    case manufactureLevel_4HLF
    case manufactureLevel_5HLF
    case manufactureLevel_5PRF
    case manufactureLevel_6HLF
    case manufactureLevel_8HLF
}

extension ManufactureLevel: Sendable {}

extension ManufactureLevel: CaseIterable {}

extension ManufactureLevel: Equatable, Comparable, Strideable {
    
    public static func == (lhs: ManufactureLevel, rhs: ManufactureLevel) -> Bool {
        return lhs.reference == rhs.reference
    }
    
    public static func < (lhs: ManufactureLevel, rhs: ManufactureLevel) -> Bool {
        return lhs.reference < rhs.reference
    }
    
    public static func > (lhs: ManufactureLevel, rhs: ManufactureLevel) -> Bool {
        return lhs.reference > rhs.reference
    }
    
    public func advanced(by n: Int) -> ManufactureLevel {
        let cases = Array(ManufactureLevel.allCases)
        guard let idx = cases.firstIndex(of: self)
        else { return .lowest }
        
        let newIdx = idx + n
        if newIdx < 0 || newIdx >= cases.count {
            return .highest
        } else {
            return cases[newIdx]
        }
    }
    
    public func distance(to other: ManufactureLevel) -> Int {
        let cases = Array(ManufactureLevel.allCases)
        guard let idxSelf = cases.firstIndex(of: self),
              let idxOther = cases.firstIndex(of: other)
        else { return 0 }
        
        return idxOther - idxSelf
    }
}

extension ManufactureLevel: APIEnum {
    
    public init(id: String) throws {
        switch id {
        case "PU43UIOG41": self = .manufactureLevel_4HLF
        case "KJ3SIISBDX": self = .manufactureLevel_5HLF
        case "SCJ3P0VTMO": self = .manufactureLevel_5PRF
        case "WA2JHA6Q7D": self = .manufactureLevel_6HLF
        case "PIGEQ0V09J": self = .manufactureLevel_8HLF
        default: throw APIEnumError.invalidId(id, apiEnum: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .manufactureLevel_4HLF: "PU43UIOG41"
        case .manufactureLevel_5HLF: "KJ3SIISBDX"
        case .manufactureLevel_5PRF: "SCJ3P0VTMO"
        case .manufactureLevel_6HLF: "WA2JHA6Q7D"
        case .manufactureLevel_8HLF: "PIGEQ0V09J"
        }
    }
    
    public init(apiValue: String) throws {
        switch apiValue.uppercased() {
        case "4HLF": self = .manufactureLevel_4HLF
        case "5HLF": self = .manufactureLevel_5HLF
        case "5PRF": self = .manufactureLevel_5PRF
        case "6HLF": self = .manufactureLevel_6HLF
        case "8HLF": self = .manufactureLevel_8HLF
        default: throw APIEnumError.invalidApiValue(apiValue, apiEnum: Self.self)
        }
    }
    public var apiValue: String {
        switch self {
        case .manufactureLevel_4HLF: "4HLF"
        case .manufactureLevel_5HLF: "5HLF"
        case .manufactureLevel_5PRF: "5PRF"
        case .manufactureLevel_6HLF: "6HLF"
        case .manufactureLevel_8HLF: "8HLF"
        }
    }
}

extension ManufactureLevel {
    
    public init?(indexLevel: Int) {
        switch indexLevel {
        case 0: self = .manufactureLevel_4HLF
        case 1: self = .manufactureLevel_5HLF
        case 2: self = .manufactureLevel_5PRF
        case 3: self = .manufactureLevel_6HLF
        case 4: self = .manufactureLevel_8HLF
        default: return nil
        }
    }
    public var indexLevel: Int {
        switch self {
        case .manufactureLevel_4HLF: 0
        case .manufactureLevel_5HLF: 1
        case .manufactureLevel_5PRF: 2
        case .manufactureLevel_6HLF: 3
        case .manufactureLevel_8HLF: 4
        }
    }
}

extension ManufactureLevel: Titleable {
    
    public var title: String {
        switch self {
        case .manufactureLevel_4HLF: String("4HLF")
        case .manufactureLevel_5HLF: String("5HLF")
        case .manufactureLevel_5PRF: String("5PRF")
        case .manufactureLevel_6HLF: String("6HLF")
        case .manufactureLevel_8HLF: String("8HLF")
        }
    }
}

public extension ManufactureLevel {
    
    var reference: String {
        switch self {
        case .manufactureLevel_4HLF: "4HLF"
        case .manufactureLevel_5HLF: "5HLF"
        case .manufactureLevel_5PRF: "5PRF"
        case .manufactureLevel_6HLF: "6HLF"
        case .manufactureLevel_8HLF: "8HLF"
        }
    }
}

public extension ManufactureLevel {
    
    static let matchableLevels = ManufactureLevel.manufactureLevel_4HLF...ManufactureLevel.manufactureLevel_5HLF
    static let matchedLevels = ManufactureLevel.manufactureLevel_5HLF...ManufactureLevel.manufactureLevel_5PRF
}

public extension ManufactureLevel {
    
    static let lowest = ManufactureLevel.manufactureLevel_4HLF
    static let highest = ManufactureLevel.manufactureLevel_8HLF
}

public extension ManufactureLevel {
    
    var lowerLevel: ManufactureLevel? {
        switch self {
        case .manufactureLevel_4HLF: nil
        case .manufactureLevel_5HLF: .manufactureLevel_4HLF
        case .manufactureLevel_5PRF: .manufactureLevel_5HLF
        case .manufactureLevel_6HLF: .manufactureLevel_5PRF
        case .manufactureLevel_8HLF: .manufactureLevel_6HLF
        }
    }
    
    var upperLevel: ManufactureLevel? {
        switch self {
        case .manufactureLevel_4HLF: .manufactureLevel_5HLF
        case .manufactureLevel_5HLF: .manufactureLevel_5PRF
        case .manufactureLevel_5PRF: .manufactureLevel_6HLF
        case .manufactureLevel_6HLF: .manufactureLevel_8HLF
        case .manufactureLevel_8HLF: nil
        }
    }
}
