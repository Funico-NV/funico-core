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
    
    public static let profileCases: [Profile] = [
        .pan,
        .mou,
        .kad,
        .bod,
        .bov
    ]
    
    public static let crossCases: [Profile] = [
        .krs,
        .khk,
        .kht
    ]
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
        switch apiValue.uppercased() {
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

extension Profile {
    
    /// Creates a profile by extracting a profile reference from a product name.
    ///
    /// The preferred matching strategy is an exact match against the dot-separated
    /// components of the name. For example:
    ///
    /// ```swift
    /// Profile(name: "5PRF.LST.SIERPANEEL.EIK FRANS.2150X145X12")
    /// // => .lijst
    /// ```
    ///
    /// Exact component matching prevents accidental substring matches such as
    /// `"SIERPANEEL"` being interpreted as `.pan`.
    ///
    /// A secondary fallback performs a substring search across the entire name.
    /// This exists to tolerate naming inconsistencies in the MRP system, where
    /// users can manually edit product names and may accidentally remove or alter
    /// separators (for example using `" ."` instead of `"."` or omitting separators
    /// altogether). In those cases a best-effort profile detection is preferred
    /// over returning `nil`.
    ///
    /// - Parameter name: The product name to inspect.
    /// - Returns: The detected profile, or `nil` when no profile reference can be
    ///   found.
    ///
    public init?(name: String) {
        let uppercaseName = name.uppercased()
        let nameComponents = uppercaseName.split(separator: ".")
        let profilesByReference = Profile.profilesByReference
        
        if let profile = nameComponents.compactMap({ profilesByReference[String($0)] }).first {
            self = profile
            return
        }
        
        guard let profile = Profile.allCases.first(where: {
            uppercaseName.contains($0.reference)
        }) else { return nil }
        
        self = profile
    }
    
    private static let profilesByReference: [String: Profile] = {
        Dictionary(uniqueKeysWithValues: Profile.allCases.map { ($0.reference, $0) })
    }()
}

extension Profile: Titleable {
    
    public var title: String {
        switch self {
        case .pan: String("PAN")
        case .mou: String("MOU")
        case .kad: String("KAD")
        case .bod: String("BOD")
        case .bov: String("BOV")
        case .krs: String("KRS")
        case .khk: String("KHK")
        case .kht: String("KHT")
        case .plint: String("PLI")
        case .lijst: String("LST")
        case .lat: String("LAT")
        case .bovenregel: String("BRG")
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

public extension Profile {
    
    var isProfile: Bool {
        Profile.profileCases.contains(self)
    }
    
    var isCross: Bool {
        Profile.crossCases.contains(self)
    }
}

public extension Optional where Wrapped == Profile {
    
    var isProfile: Bool {
        return self?.isProfile ?? false
    }
    
    var isCross: Bool {
        return self?.isCross ?? false
    }
}
