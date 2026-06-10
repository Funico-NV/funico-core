//
//  Dimension.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 05/02/2024.
//

import FunicoFoundation

public enum Dimension {
    
    case warehouse
    case location
    
    case quality
    case choice
    case serialnumber
    
    case config
    case pallet
    case batch
    
    case length
}

extension Dimension: ERPCodeRepresentable {
    
    public init(id: String) throws {
        switch id {
        case "D92AFUIN4F": self = .warehouse
        case "Y5WKVJIJOJ": self = .location
        case "AZQWSVIEOS": self = .quality
        case "P8DDVUTV33": self = .choice
        case "JD51TJ0IJU": self = .serialnumber
        case "OQUNA0ZB48": self = .config
        case "YH40IBWTKW": self = .pallet
        case "CX4CQ7EY4L": self = .batch
        case "BE55DVDWFS": self = .length
        default: throw ERPCodeError<ERPCode, Self>.invalidId(id, type: Self.self)
        }
    }
    public var id: String {
        switch self {
        case .warehouse: "D92AFUIN4F"
        case .location: "Y5WKVJIJOJ"
        case .quality: "AZQWSVIEOS"
        case .choice: "P8DDVUTV33"
        case .serialnumber: "JD51TJ0IJU"
        case .config: "OQUNA0ZB48"
        case .pallet: "YH40IBWTKW"
        case .batch: "CX4CQ7EY4L"
        case .length: "BE55DVDWFS"
        }
    }
    
    public init(erpCode: String) throws {
        switch erpCode {
        case "Magazijn": self = .warehouse
        case "Locatie": self = .location
        case "Kwaliteit": self = .quality
        case "Keus": self = .choice
        case "Serienummer": self = .serialnumber
        case "Garnituur": self = .config
        case "Pallet-ID": self = .pallet
        case "Batchnummer": self = .batch
        case "Lengte": self = .length
        default: throw ERPCodeError<ERPCode, Self>.invalidCode(erpCode, type: Self.self)
        }
    }
    public var erpCode: String {
        switch self {
        case .warehouse: "Magazijn"
        case .location: "Locatie"
        case .quality: "Kwaliteit"
        case .choice: "Keus"
        case .serialnumber: "Serienummer"
        case .config: "Garnituur"
        case .pallet: "Pallet-ID"
        case .batch: "Batchnummer"
        case .length: "Lengte"
        }
    }
}

extension Dimension: Titleable {
    
    public var title: String {
        switch self {
        case .warehouse: String("Warehouse")
        case .location: String("Location")
        case .quality: String("Quality")
        case .choice: String("Choice")
        case .serialnumber: String("Serial Number")
        case .config: String("Configuration")
        case .pallet: String("Pallet")
        case .batch: String("Batch")
        case .length: String("Length")
        }
    }
}
