//
//  DimensionGroup.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 05/02/2024.
//

public enum DimensionGroup {
    
    case M
    case M_L_1
    case M_C
    case _A
    case M_C_K
    case M_C_L_B
    case M_K
    case M_L_K
    case C_M_B_L
    case K_M_B_L
    case K_M_L
    case KPI
    case M_B
    case M_B_L
    case M_B_L_SN
    case M_L
}

extension DimensionGroup: Sendable {}

extension DimensionGroup: CaseIterable {}

extension DimensionGroup: APIEnum {
    
    public init(id: String) throws {
        switch id {
        case "DBTSAWS69E": self = .M
        case "X1VLW62CM4": self = .M_L_1
        case "XYXE958EFV": self = .M_C
        case "CU7YUT7H77": self = ._A
        case "AA7W6Y66E6": self = .M_C_K
        case "XY4NK1HMZG": self = .M_C_L_B
        case "YWLDTUGFQG": self = .M_K
        case "LVHOO05I27": self = .M_L_K
        case "MS2Y46VQ5R": self = .C_M_B_L
        case "RN872AQTF1": self = .K_M_B_L
        case "M7MKDAZ3TO": self = .K_M_L
        case "RSP9RKSMBJ": self = .KPI
        case "TEJWSH6G0X": self = .M_B
        case "FQ63GOA8GI": self = .M_B_L
        case "B1O8DWPABS": self = .M_B_L_SN
        case "ZJUE4QNEA7": self = .M_L
        default: throw APIEnumError.invalidId(id, apiEnum: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .M: "DBTSAWS69E"
        case .M_L_1: "X1VLW62CM4"
        case .M_C: "XYXE958EFV"
        case ._A: "CU7YUT7H77"
        case .M_C_K: "AA7W6Y66E6"
        case .M_C_L_B: "XY4NK1HMZG"
        case .M_K: "YWLDTUGFQG"
        case .M_L_K: "LVHOO05I27"
        case .C_M_B_L: "MS2Y46VQ5R"
        case .K_M_B_L: "RN872AQTF1"
        case .K_M_L: "M7MKDAZ3TO"
        case .KPI: "RSP9RKSMBJ"
        case .M_B: "TEJWSH6G0X"
        case .M_B_L: "FQ63GOA8GI"
        case .M_B_L_SN: "B1O8DWPABS"
        case .M_L: "ZJUE4QNEA7"
        }
    }
    
    public init(apiValue: String) throws {
        switch apiValue.uppercased() {
        case "10": self = .M
        case "11": self = .M_L_1
        case "20": self = .M_C
        case "21": self = ._A
        case "30": self = .M_C_K
        case "40": self = .M_C_L_B
        case "50": self = .M_K
        case "60": self = .M_L_K
        case "C-M-B-L": self = .C_M_B_L
        case "K-M-B-L": self = .K_M_B_L
        case "K-M-L": self = .K_M_L
        case "KPI": self = .KPI
        case "M-B": self = .M_B
        case "M-B-L": self = .M_B_L
        case "M-B-L-SN": self = .M_B_L_SN
        case "M-L": self = .M_L
        default: throw APIEnumError.invalidApiValue(apiValue, apiEnum: Self.self)
        }
    }
    public var apiValue: String {
        switch self {
        case .M: "10"
        case .M_L_1: "11"
        case .M_C: "20"
        case ._A: "21"
        case .M_C_K: "30"
        case .M_C_L_B: "40"
        case .M_K: "50"
        case .M_L_K: "60"
        case .C_M_B_L: "C-M-B-L"
        case .K_M_B_L: "K-M-B-L"
        case .K_M_L: "K-M-L"
        case .KPI: "KPI"
        case .M_B: "M-B"
        case .M_B_L: "M-B-L"
        case .M_B_L_SN: "M-B-L-SN"
        case .M_L: "M-L"
        }
    }
}

extension DimensionGroup: Titleable {
    
    public var title: String {
        switch self {
        case .M: String("10")
        case .M_L_1: String("11")
        case .M_C: String("20")
        case ._A: String("21")
        case .M_C_K: String("30")
        case .M_C_L_B: String("40")
        case .M_K: String("50")
        case .M_L_K: String("60")
        case .C_M_B_L: String("C-M-B-L")
        case .K_M_B_L: String("K-M-B-L")
        case .K_M_L: String("K-M-L")
        case .KPI: String("KPI")
        case .M_B: String("M-B")
        case .M_B_L: String("M-B-L")
        case .M_B_L_SN: String("M-B-L-SN")
        case .M_L: String("M-L")
        }
    }
}

public extension DimensionGroup {
    
    var hasQuality: Bool {
        return [
            Dimension.quality,
            Dimension.choice,
            Dimension.serialnumber
        ].contains(where: {
            self.dimensions.contains($0)
        })
    }
}

public extension DimensionGroup {
    
    var dimensions: [Dimension] {
        switch self {
        case .M:
            return [.warehouse]
        case .M_L_1:
            return [.warehouse, .location]
        case .M_C:
            return [.warehouse, .config]
        case ._A:
            return [.warehouse, .config]
        case .M_C_K:
            return [.warehouse, .config, .choice]
        case .M_C_L_B:
            return [.warehouse, .config, .length, .batch]
        case .M_K:
            return [.warehouse, .quality]
        case .M_L_K:
            return [.warehouse, .length, .quality]
        case .C_M_B_L:
            return [.config, .warehouse, .batch, .location]
        case .K_M_B_L:
            return [.quality, .warehouse, .batch, .location]
        case .K_M_L:
            return [.quality, .warehouse, .location]
        case .KPI:
            return [.config, .warehouse]
        case .M_B:
            return [.warehouse, .batch]
        case .M_B_L:
            return [.warehouse, .batch, .location]
        case .M_B_L_SN:
            return [.warehouse, .batch, .location, .serialnumber]
        case .M_L:
            return [.warehouse, .location]
        }
    }
}
