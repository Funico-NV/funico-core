//
//  OrderDemandModel.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 10/06/2026.
//

import Foundation

public protocol OrderDemandModel: OrderModel, Articlable {
    
    var quantity: Demand { get set }
    var remaining: Demand { get }
    
    var shippingDate: Date { get }
    var createdDate: Date { get }
    
    var countryCode: String? { get }
}
