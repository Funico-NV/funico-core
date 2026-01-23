//
//  Material.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 13/09/2023.
//

public enum Material {
    
    case EIK
    case EIKBODEM
    case EIKFRANS
    case EIKROOD
    case EIKRUSTIEK
    case DEN
    case FINEER
    case KUNSTSTOF
    case METAAL
    case PINE
    case PINMARITIME
    case PLAATMATERIAAL
    case POPULIER
    case PRINT
    case TROPISCH
    case ZINK
    case INHEEMS
    case LANGLOPEND
    case THANA
}

extension Material: Sendable {}

extension Material: CaseIterable {}

extension Material: APIEnum {
    
    public init(id: String) throws {
        switch id {
        case "KOKRO45F62": self = .EIK
        case "FM4OOWAC20": self = .EIKBODEM
        case "SP2DUHOC6D": self = .EIKFRANS
        case "RBIIJT2BE9": self = .EIKROOD
        case "STQ9NWO509": self = .EIKRUSTIEK
        case "EMQPBXRZZW": self = .DEN
        case "S2CW4TXEFL": self = .FINEER
        case "YO8F8X7LRU": self = .KUNSTSTOF
        case "LL0N6MA2TU": self = .METAAL
        case "MDD459SGGX": self = .PINE
        case "QINGU891B7": self = .PINMARITIME
        case "JKXK5NSKHW": self = .PLAATMATERIAAL
        case "ZAEIAL441Y": self = .POPULIER
        case "J42KUVAWMT": self = .PRINT
        case "TEFC47CYM0": self = .TROPISCH
        case "RSH1P2BPS4": self = .ZINK
        case "X0GX2B2A7N": self = .INHEEMS
        case "XRTET2086X": self = .LANGLOPEND
        case "TIKV7TNJH7": self = .THANA
        default: throw APIEnumError.invalidId(id, apiEnum: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .EIK: "KOKRO45F62"
        case .EIKBODEM: "FM4OOWAC20"
        case .EIKFRANS: "SP2DUHOC6D"
        case .EIKROOD: "RBIIJT2BE9"
        case .EIKRUSTIEK: "STQ9NWO509"
        case .DEN: "EMQPBXRZZW"
        case .FINEER: "S2CW4TXEFL"
        case .KUNSTSTOF: "YO8F8X7LRU"
        case .METAAL: "LL0N6MA2TU"
        case .PINE: "MDD459SGGX"
        case .PINMARITIME: "QINGU891B7"
        case .PLAATMATERIAAL: "JKXK5NSKHW"
        case .POPULIER: "ZAEIAL441Y"
        case .PRINT: "J42KUVAWMT"
        case .TROPISCH: "TEFC47CYM0"
        case .ZINK: "RSH1P2BPS4"
        case .INHEEMS: "X0GX2B2A7N"
        case .LANGLOPEND: "XRTET2086X"
        case .THANA: "TIKV7TNJH7"
        }
    }
    
    public init(apiValue: String) throws {
        switch apiValue {
        case "EIK": self = .EIK
        case "EIKBODEM": self = .EIKBODEM
        case "EIKFRANS": self = .EIKFRANS
        case "EIKROOD": self = .EIKROOD
        case "EIKRUSTIEK": self = .EIKRUSTIEK
        case "DEN": self = .DEN
        case "FINEER": self = .FINEER
        case "KUNSTSTOF": self = .KUNSTSTOF
        case "METAAL": self = .METAAL
        case "PINE": self = .PINE
        case "PIN MARITIME": self = .PINMARITIME
        case "PLAATMATER": self = .PLAATMATERIAAL
        case "POPULIER": self = .POPULIER
        case "PRINT": self = .PRINT
        case "TROPISCH": self = .TROPISCH
        case "ZINK": self = .ZINK
        case "INHEEMS": self = .INHEEMS
        case "LANGLOPEND": self = .LANGLOPEND
        case "THANA": self = .THANA
        default: throw APIEnumError.invalidApiValue(apiValue, apiEnum: Self.self)
        }
    }
    public var apiValue: String {
        switch self {
        case .EIK: "EIK"
        case .EIKBODEM: "EIKBODEM"
        case .EIKFRANS: "EIKFRANS"
        case .EIKROOD: "EIKROOD"
        case .EIKRUSTIEK: "EIKRUSTIEK"
        case .DEN: "DEN"
        case .FINEER: "FINEER"
        case .KUNSTSTOF: "KUNSTSTOF"
        case .METAAL: "METAAL"
        case .PINE: "PINE"
        case .PINMARITIME: "PIN MARITIME"
        case .PLAATMATERIAAL: "PLAATMATER"
        case .POPULIER: "POPULIER"
        case .PRINT: "PRINT"
        case .TROPISCH: "TROPISCH"
        case .ZINK: "ZINK"
        case .INHEEMS: "INHEEMS"
        case .LANGLOPEND: "LANGLOPEND"
        case .THANA: "THANA"
        }
    }
}

extension Material: Titleable {
    
    public var title: String {
        switch self {
        case .EIK: String(localized: "EIK")
        case .EIKBODEM: String(localized: "EIKBODEM")
        case .EIKFRANS: String(localized: "EIKFRANS")
        case .EIKROOD: String(localized: "EIKROOD")
        case .EIKRUSTIEK: String(localized: "EIKRUSTIEK")
        case .DEN: String(localized: "DEN")
        case .FINEER: String(localized: "FINEER")
        case .KUNSTSTOF: String(localized: "KUNSTSTOF")
        case .METAAL: String(localized: "METAAL")
        case .PINE: String(localized: "PINE")
        case .PINMARITIME: String(localized: "PIN MARITIME")
        case .PLAATMATERIAAL: String(localized: "PLAATMATER")
        case .POPULIER: String(localized: "POPULIER")
        case .PRINT: String(localized: "PRINT")
        case .TROPISCH: String(localized: "TROPISCH")
        case .ZINK: String(localized: "ZINK")
        case .INHEEMS: String(localized: "INHEEMS")
        case .LANGLOPEND: String(localized: "LANGLOPEND")
        case .THANA: String(localized: "THANA")
        }
    }
}

public extension Material {
    
    var erpValue: String {
        switch self {
        case .EIKBODEM:
            return "EIK.BODEM"
        case .EIKFRANS:
            return "EIK.FRANS"
        case .EIKROOD:
            return "EIK.ROOD"
        case .EIKRUSTIEK:
            return "EIK.RUSTIEK"
        default:
            return self.apiValue
        }
    }
}

public extension Material {
    
    var materialGroup: MaterialGroup {
        switch self {
        case .FINEER, .PRINT, .PLAATMATERIAAL:
            return .PRINT
        case .KUNSTSTOF:
            return .PLASTIC
        case .METAAL, .ZINK:
            return .METAL
        default:
            return .SOLID
        }
    }
}
