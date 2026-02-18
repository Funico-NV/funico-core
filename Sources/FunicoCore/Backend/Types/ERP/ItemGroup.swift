//
//  ItemGroup.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 13/09/2023.
//

/// Enum representing different item groups.
///
/// - Note: This enum only includes the `ItemGroup`s necessary for scheduling. Other `ItemGroup`s are filtered out in the API.
///
public enum ItemGroup {
    
    case KIST
    case KIST_HAND
    case HOL
    case ITA
    case URNES
    case CEREMONIE
    
    case ONDERBAK
    case DEKSELS
    
    case PANELEN
    case MOULUREN
    case PLATTE_KAD
    case KADERS
    
    case BODEMS
    case BOVENBLAD
    
    case PLINTEN
    case PROFIELEN
    
    case HALFFABAF
    case HALFFABON
    case DIV_AAN
    case DIV_EF
    case GROND
}

extension ItemGroup: Sendable {}

extension ItemGroup: Comparable {}

extension ItemGroup: CaseIterable {}

extension ItemGroup: APIEnum {
    
    public init(id: String) throws {
        switch id {
        case "M5Q1Q7CA7P": self = .KIST
        case "OA1G29Y2D5": self = .KIST_HAND
        case "XCL8V1I56X": self = .HOL
        case "NIIUBKH7PH": self = .ITA
        case "WH1OSE454Y": self = .URNES
        case "FH3Q07731X": self = .CEREMONIE
        case "IJHLO3FJ15": self = .ONDERBAK
        case "U0RQJFCYP3": self = .DEKSELS
        case "Q8XPNW130D": self = .PANELEN
        case "H4JN62OZPW": self = .MOULUREN
        case "N4J7444LC3": self = .PLATTE_KAD
        case "JFEQDDR01U": self = .KADERS
        case "JJY6NAFR0F": self = .BODEMS
        case "LH9WC0FUII": self = .BOVENBLAD
        case "QJA4NYB1FZ": self = .PLINTEN
        case "UW3NPPTUM0": self = .PROFIELEN
        case "QKSJUQNA24": self = .HALFFABAF
        case "O3JMJ3G6IO": self = .HALFFABON
        case "MRR5OJFCNK": self = .DIV_AAN
        case "EYLC46G922": self = .DIV_EF
        case "JI7YOR1X1I": self = .GROND
        default: throw APIEnumError.invalidId(id, apiEnum: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .KIST: "M5Q1Q7CA7P"
        case .KIST_HAND: "OA1G29Y2D5"
        case .HOL: "XCL8V1I56X"
        case .ITA: "NIIUBKH7PH"
        case .URNES: "WH1OSE454Y"
        case .CEREMONIE: "FH3Q07731X"
        case .ONDERBAK: "IJHLO3FJ15"
        case .DEKSELS: "U0RQJFCYP3"
        case .PANELEN: "Q8XPNW130D"
        case .MOULUREN: "H4JN62OZPW"
        case .PLATTE_KAD: "N4J7444LC3"
        case .KADERS: "JFEQDDR01U"
        case .BODEMS: "JJY6NAFR0F"
        case .BOVENBLAD: "LH9WC0FUII"
        case .PLINTEN: "QJA4NYB1FZ"
        case .PROFIELEN: "UW3NPPTUM0"
        case .HALFFABAF: "QKSJUQNA24"
        case .HALFFABON: "O3JMJ3G6IO"
        case .DIV_AAN: "MRR5OJFCNK"
        case .DIV_EF: "EYLC46G922"
        case .GROND: "JI7YOR1X1I"
        }
    }
    
    public init(apiValue: String) throws {
        switch apiValue.uppercased() {
        case "KIST": self = .KIST
        case "KIST HAND": self = .KIST_HAND
        case "HOL": self = .HOL
        case "ITA": self = .ITA
        case "URNES": self = .URNES
        case "CEREMONIE": self = .CEREMONIE
        case "ONDERBAK": self = .ONDERBAK
        case "DEKSELS": self = .DEKSELS
        case "PANELEN": self = .PANELEN
        case "MOULUREN": self = .MOULUREN
        case "PLATTE KAD": self = .PLATTE_KAD
        case "KADERS": self = .KADERS
        case "BODEMS": self = .BODEMS
        case "BOVENBLAD": self = .BOVENBLAD
        case "PLINTEN": self = .PLINTEN
        case "PROFIELEN": self = .PROFIELEN
        case "HALFFABAF": self = .HALFFABAF
        case "HALFFABON": self = .HALFFABON
        case "DIV AAN": self = .DIV_AAN
        case "DIV EF": self = .DIV_EF
        case "GROND": self = .GROND
        default: throw APIEnumError.invalidApiValue(apiValue, apiEnum: Self.self)
        }
    }
    public var apiValue: String {
        switch self {
        case .KIST: "KIST"
        case .KIST_HAND: "KIST HAND"
        case .HOL: "HOL"
        case .ITA: "ITA"
        case .URNES: "URNES"
        case .CEREMONIE: "CEREMONIE"
        case .ONDERBAK: "ONDERBAK"
        case .DEKSELS: "DEKSELS"
        case .PANELEN: "PANELEN"
        case .MOULUREN: "MOULUREN"
        case .PLATTE_KAD: "PLATTE KAD"
        case .KADERS: "KADERS"
        case .BODEMS: "BODEMS"
        case .BOVENBLAD: "BOVENBLAD"
        case .PLINTEN: "PLINTEN"
        case .PROFIELEN: "PROFIELEN"
        case .HALFFABAF: "HALFFABAF"
        case .HALFFABON: "HALFFABON"
        case .DIV_AAN: "DIV AAN"
        case .DIV_EF: "DIV EF"
        case .GROND: "GROND"
        }
    }
}

extension ItemGroup: Titleable {
    
    public var title: String {
        switch self {
        case .KIST: String("KIST")
        case .KIST_HAND: String("KIST HAND")
        case .HOL: String("HOL")
        case .ITA: String("ITA")
        case .URNES: String("URNES")
        case .CEREMONIE: String("CEREMONIE")
        case .ONDERBAK: String("ONDERBAK")
        case .DEKSELS: String("DEKSELS")
        case .PANELEN: String("PANELEN")
        case .MOULUREN: String("MOULUREN")
        case .PLATTE_KAD: String("PLATTE KAD")
        case .KADERS: String("KADERS")
        case .BODEMS: String("BODEMS")
        case .BOVENBLAD: String("BOVENBLAD")
        case .PLINTEN: String("PLINTEN")
        case .PROFIELEN: String("PROFIELEN")
        case .HALFFABAF: String("HALFFABAF")
        case .HALFFABON: String("HALFFABON")
        case .DIV_AAN: String("DIV AAN")
        case .DIV_EF: String("DIV EF")
        case .GROND: String("GROND")
        }
    }
}

public extension ItemGroup {
    
    var isEndProduct: Bool {
        switch self {
        case .KIST, .KIST_HAND, .HOL, .ITA, .URNES, .CEREMONIE:
            return true
        default:
            return false
        }
    }
}
