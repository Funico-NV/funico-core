//
//  Profile.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 27/11/2023.
//

public enum Profile {
    
    case pan
    case mou
    case kad
    case bod
    case bov
    case krs
    case khk
    case kht
    case plint
    case lijst
    case lat
    case bovenregel
}

extension Profile: Sendable {}

extension Profile: CaseIterable {
    
    static let profiles: [Profile] = [.pan, .mou, .kad, .bod, .bov]
    
    static let crosses: [Profile] = [.krs, .khk, .kht]
}

extension Profile: APIEnum {
    
    public init(id: String) throws {
        switch id {
        case "M1KV921QPW": self = .pan
        case "L7CYUAAYDR": self = .mou
        case "IA51PSX9PB": self = .kad
        case "R5A0O453GI": self = .bod
        case "Z04Y5GOPDC": self = .bov
        case "HTUD54D689": self = .krs
        case "K0DHZD54O8": self = .khk
        case "AAFG4DS65D": self = .kht
        case "TUU4EXKWK0": self = .plint
        case "QFXY3RH7XS": self = .lijst
        case "WT03LBIX9F": self = .lat
        case "LONVNA05RA": self = .bovenregel
        default: throw APIEnumError.invalidId(id, apiEnum: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .pan: "M1KV921QPW"
        case .mou: "L7CYUAAYDR"
        case .kad: "IA51PSX9PB"
        case .bod: "R5A0O453GI"
        case .bov: "Z04Y5GOPDC"
        case .krs: "HTUD54D689"
        case .khk: "K0DHZD54O8"
        case .kht: "AAFG4DS65D"
        case .plint: "TUU4EXKWK0"
        case .lijst: "QFXY3RH7XS"
        case .lat: "WT03LBIX9F"
        case .bovenregel: "LONVNA05RA"
        }
    }
    
    public init(apiValue: String) throws {
        switch apiValue {
        case "PAN": self = .pan
        case "MOU": self = .mou
        case "KAD": self = .kad
        case "BOD": self = .bod
        case "BOV": self = .bov
        case "KRS": self = .krs
        case "KHK": self = .khk
        case "KHT": self = .kht
        case "PLI": self = .plint
        case "LST": self = .lijst
        case "LAT": self = .lat
        case "BRG": self = .bovenregel
        default: throw APIEnumError.invalidApiValue(apiValue, apiEnum: Self.self)
        }
    }
    public var apiValue: String {
        switch self {
        case .pan: "PAN"
        case .mou: "MOU"
        case .kad: "KAD"
        case .bod: "BOD"
        case .bov: "BOV"
        case .krs: "KRS"
        case .khk: "KHK"
        case .kht: "KHT"
        case .plint: "PLI"
        case .lijst: "LST"
        case .lat: "LAT"
        case .bovenregel: "BRG"
        }
    }
}

extension Profile: Titleable {
    
    public var title: String {
        switch self {
        case .pan: String(localized: "PAN", table: "Profile")
        case .mou: String(localized: "MOU", table: "Profile")
        case .kad: String(localized: "KAD", table: "Profile")
        case .bod: String(localized: "BOD", table: "Profile")
        case .bov: String(localized: "BOV", table: "Profile")
        case .krs: String(localized: "KRS", table: "Profile")
        case .khk: String(localized: "KHK", table: "Profile")
        case .kht: String(localized: "KHT", table: "Profile")
        case .plint: String(localized: "PLI", table: "Profile")
        case .lijst: String(localized: "LST", table: "Profile")
        case .lat: String(localized: "LAT", table: "Profile")
        case .bovenregel: String(localized: "BRG", table: "Profile")
        }
    }
}

public extension Profile {
    
    var reference: String {
        switch self {
        case .pan: "PAN"
        case .mou: "MOU"
        case .kad: "KAD"
        case .bod: "BOD"
        case .bov: "BOV"
        case .krs: "KRS"
        case .khk: "KHK"
        case .kht: "KHT"
        case .plint: "PLI"
        case .lijst: "LST"
        case .lat: "LAT"
        case .bovenregel: "BRG"
        }
    }
}

extension Profile {
    
    var isProfile: Bool {
        return Profile.profiles.contains(self)
    }
    
    var isCross: Bool {
        return Profile.crosses.contains(self)
    }
}

extension Optional where Wrapped == Profile {
    
    var isProfile: Bool {
        return self?.isProfile ?? false
    }
    
    var isCross: Bool {
        return self?.isCross ?? false
    }
}
