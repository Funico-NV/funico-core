//
//  Article.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 24/12/2025.
//

import Foundation

public struct Article: Codable {
    
    public let itemId: String
    private(set) var _part: String?
    public var part: Part? {
        get {
            guard let _part else { return nil }
            return try? Part(codable: _part)
        }
        set { _part = newValue?.codable }
    }
    private(set) var _quality: String?
    public var quality: Quality? {
        get {
            guard let _quality else { return nil }
            return try? Quality(codable: _quality)
        }
        set { _quality = newValue?.codable }
    }
    public var length: Float?
    
    public init(_ itemId: String, part: Part? = nil, quality: Quality? = nil, length: Float? = nil) {
        self.itemId = itemId
        self._part = part?.codable
        self.part = part
        self._quality = quality?.codable
        self.quality = quality
        self.length = length
    }
    
    public init?(_ itemId: String?, part: Part? = nil, quality: Quality? = nil, length: Float? = nil) {
        guard let itemId else { return nil }
        
        self.itemId = itemId
        self._part = part?.codable
        self.part = part
        self._quality = quality?.codable
        self.quality = quality
        self.length = length
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.itemId = try values.decode(String.self, forKey: .itemId)
        self._part = try values.decodeIfPresent(String.self, forKey: ._part)
        self._quality = try values.decodeIfPresent(String.self, forKey: ._quality)
        self.length = try values.decodeIfPresent(Float.self, forKey: .length)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(itemId, forKey: .itemId)
        try container.encodeIfPresent(_part, forKey: ._part)
        try container.encodeIfPresent(_quality, forKey: ._quality)
        try container.encodeIfPresent(length, forKey: .length)
    }
}

extension Article: Sendable {}

extension Article: Identifiable, Hashable, Equatable, Comparable {
    
    public var id: String {
        return itemId + (part?.id ?? "") + (quality?.id ?? "") + (length?.formatted() ?? "")
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(itemId.uppercased())
        hasher.combine(part)
        hasher.combine(quality)
        hasher.combine(length)
    }
    
    public static func == (lhs: Article, rhs: Article) -> Bool {
        return (
            (lhs.itemId.uppercased() == rhs.itemId.uppercased()) &&
            (lhs.part == rhs.part) &&
            (lhs.quality == rhs.quality) &&
            (lhs.length == rhs.length)
        )
    }
    
    public static func < (lhs: Article, rhs: Article) -> Bool {
        return (
            (lhs.itemId.uppercased() + (lhs.quality?.title ?? "") + (lhs.part?.reference ?? "") + (lhs.length?.formatted() ?? "")) <
            (rhs.itemId.uppercased() + (rhs.quality?.title ?? "") + (rhs.part?.reference ?? "") + (lhs.length?.formatted() ?? ""))
        )
    }
}

public extension Article {
    
    func from(quality newQuality: Quality?) -> Self {
        return .init(itemId, part: part, quality: newQuality, length: length)
    }
    
    func from(part newPart: Part?) -> Self {
        return .init(itemId, part: newPart, quality: quality, length: length)
    }
    
    func from(length newLength: Float?) -> Self {
        return .init(itemId, part: part, quality: quality, length: newLength)
    }
}

public extension Article {
    
    var reserved: Article {
        guard !itemId.hasSuffix("G") else { return self }
        return .init(itemId.replacingOccurrences(of: "g", with: "") + "G", part: part, quality: quality, length: length)
    }
}

public extension Article {
    
    func title(length showLength: Bool = false) -> String {
        if let part, let quality {
            return itemId + part.reference + "-" + quality.title
        } else if let part {
            return itemId + part.reference
        } else if let quality {
            return itemId + "-" + quality.title
        } else if let length, showLength {
            return itemId + " | " + length.formatted(.length)
        } else {
            return itemId
        }
    }
    
    var title: String {
        return title()
    }
    
    var item: String {
        if let part {
            return itemId + part.reference
        } else {
            return itemId
        }
    }
    
    var manufactureLevel: ManufactureLevel? {
        guard let firstDigit = itemId.first?.wholeNumberValue else { return nil }
        
        if itemId.count >= 5 {
            switch firstDigit {
            case 4: return .manufactureLevel_4HLF
            case 5:
                if let secondDigit = itemId.dropFirst().first?.wholeNumberValue {
                    return secondDigit < 5 ? .manufactureLevel_5PRF : .manufactureLevel_5HLF
                }
                return nil
            case 6: return .manufactureLevel_6HLF
            case 8: return .manufactureLevel_8HLF
            default: return nil
            }
        } else {
            return .manufactureLevel_6HLF
        }
    }
}

public extension Article {
    
    func getPool(name: String? = nil) -> Pool? {
        return Self.getPool(from: itemId, name: name)
    }
    
    static func getPool(from itemId: String, name: String?) -> Pool? {
        if itemId.last == "G" {
            return .finishedEndProducts
        } else {
            if itemId.count > 4 {
                guard let poolChar = itemId.first,
                      let poolInt = Int(String(poolChar)) else { return nil }
                return Pool(pool: poolInt)
            } else {
                if let name {
                    if name.contains(ManufactureLevel.manufactureLevel_6HLF.title) {
                        return .finishedSemiFinishedProducts
                    } else {
                        return .sprayedEndProducts
                    }
                } else {
                    return .sprayedEndProducts
                }
            }
        }
    }
}

extension Article {
    
    fileprivate enum CodingKeys: String, CodingKey {
        case itemId
        
        case _part
        case _quality
        case length
    }
}
