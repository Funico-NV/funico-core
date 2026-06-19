//
//  IDExtractable.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 19/06/2026.
//

public protocol IDExtractable: Identifiable where ID: LosslessStringConvertible {
    
    var id: ID { get }
    
    init?(id: ID)
}
