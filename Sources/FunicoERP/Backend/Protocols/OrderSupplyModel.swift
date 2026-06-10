//
//  OrderSupplyModel.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 10/06/2026.
//

import Foundation

public protocol OrderSupplyModel: OrderModel, Articlable {
    
    var order: Order { get }
    
    var quantity: Supply { get set }
    
    var createdDate: Date { get }
}
