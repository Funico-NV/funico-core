//
//  OrderModel.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 10/06/2026.
//

import Foundation

public protocol OrderModel: Codable, Identifiable {
    
    var quantity: Float { get set }
    
    var createdDate: Date { get }
}
