//
//  Articlable.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

public protocol Articlable {
    
    typealias RawPart = Part.CodableType
    typealias RawQuality = Quality.CodableType
    
    var _itemId: String { get }
    var _part: RawPart? { get }
    var _quality: RawQuality? { get }
    var _length: Float? { get }
}

public extension Articlable {
    
    var article: Article {
        let part: Part? = _part.flatMap({ try? Part(codable: $0) })
        let quality: Quality? = _quality.flatMap({ try? Quality(codable: $0) })
        
        return Article(_itemId, part: part, quality: quality, length: _length)
    }
}
