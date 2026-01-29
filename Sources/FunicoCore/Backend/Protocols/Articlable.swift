//
//  Articlable.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

public protocol Articlable {
    
    typealias RawPart = Part.APIValue
    typealias RawQuality = Quality.APIValue
    
    var itemId: String { get }
    var part: RawPart? { get }
    var quality: RawQuality? { get }
    var length: Float? { get }
}

public extension Articlable {
    
    var article: Article {
        let part: Part? = part.flatMap({ try? Part(apiValue: $0) })
        let quality: Quality? = quality.flatMap({ try? Quality(apiValue: $0) })
        
        return Article(itemId, part: part, quality: quality, length: length)
    }
}
