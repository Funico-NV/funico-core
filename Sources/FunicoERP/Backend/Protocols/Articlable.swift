//
//  Articlable.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

public protocol Articlable {
    
    typealias RawPart = Part.ERPCode
    typealias RawQuality = Quality.ERPCode
    
    var itemId: String { get }
    var part: RawPart? { get }
    var quality: RawQuality? { get }
    /// The length that is part of the article key (dimension `BE55DVDWFS`).
    var itemLength: Float? { get }
}

public extension Articlable {
    
    var article: Article {
        let part: Part? = part.flatMap({ try? Part(erpCode: $0) })
        let quality: Quality? = quality.flatMap({ try? Quality(erpCode: $0) })
        
        return Article(itemId, part: part, quality: quality, itemLength: itemLength)
    }
}
