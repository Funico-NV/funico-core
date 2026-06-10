//
//  ERPCodeRepresentable+APIValueRepresentable.swift
//  funico-core
//
//  Created by Codex on 10/06/2026.
//

import FunicoERP

public extension APIValueRepresentable where Self: ERPCodeRepresentable, APIValue == ERPCode {
    
    init(apiValue: ERPCode) throws {
        try self.init(erpCode: apiValue)
    }
    
    var apiValue: ERPCode {
        return self.erpCode
    }
}

extension BomType: APIValueRepresentable {}
extension Dimension: APIValueRepresentable {}
extension DimensionGroup: APIValueRepresentable {}
extension ItemGroup: APIValueRepresentable {}
extension ItemType: APIValueRepresentable {}
extension ManufactureLevel: APIValueRepresentable {}
extension Material: APIValueRepresentable {}
extension MaterialGroup: APIValueRepresentable {}
extension OrderStatus: APIValueRepresentable {}
extension Part: APIValueRepresentable {}
extension Pool: APIValueRepresentable {}
extension PriceType: APIValueRepresentable {}
extension Profile: APIValueRepresentable {}
extension Quality: APIValueRepresentable {}
extension SalesStatus: APIValueRepresentable {}
extension TransferStatus: APIValueRepresentable {}
extension Warehouse: APIValueRepresentable {}
