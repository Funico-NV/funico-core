//
//  OrderModel.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 10/06/2026.
//

import Foundation

public protocol OrderModel: Codable, Identifiable {
    
    var order: Order { get }
    var quantity: Float { get set }
    var createdDate: Date { get }
}

public extension OrderModel {
    
    var orderNumber: Int {
        let digits = order.filter(\.isNumber)
        
        return Int(digits) ?? .zero
    }
}
