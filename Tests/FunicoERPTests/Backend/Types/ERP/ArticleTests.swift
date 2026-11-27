//
//  ArticleTests.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 21/01/2026.
//

import Foundation
import Testing
@testable import FunicoERP

struct ArticleTests {
    
    @Test("Title for article '40315K'")
    func title_40315K() {
        let article: Article = Article("40315", part: .head)
        
        #expect(article.title == "40315K")
    }
    
    @Test("Title for article '40288RD-A'")
    func title_40288RD_A() {
        let article: Article = Article("40288", part: .rthigh, quality: .A)
        
        #expect(article.title == "40288RD-A")
    }
    
    @Test("Initialize from string literal '40315K'")
    func initializeStringLiteral_40315K() {
        let article: Article = "40315K"
        
        #expect(article.itemId == "40315")
        #expect(article.part == .head)
        #expect(article.quality == nil)
        #expect(article.itemLength == nil)
    }
    
    @Test("Initialize from string literal '40288RD-A'")
    func initializeStringLiteral_40288RD_A() {
        let article: Article = "40288RD-A"
        
        #expect(article.itemId == "40288")
        #expect(article.part == .rthigh)
        #expect(article.quality == .A)
        #expect(article.itemLength == nil)
    }
    
    @Test("Initialize from string literal '60150 | 1665'")
    func initializeStringLiteral_60150_1665() {
        let article: Article = "60150 | 1665"
        
        #expect(article.itemId == "60150")
        #expect(article.part == nil)
        #expect(article.quality == nil)
        #expect(article.itemLength == 1665)
    }
    
    @Test("Initialize from string literal '60220-RA | 2200'")
    func initializeStringLiteral_60220_RA_2200() {
        let article: Article = "60220-RA | 2200"
        
        #expect(article.itemId == "60220")
        #expect(article.part == nil)
        #expect(article.quality == .RA)
        #expect(article.itemLength == 2200)
    }
    
    @Test("Initialize from integer literal '2298'")
    func initializeIntegerLiteral_2298() {
        let article: Article = 2298
        
        #expect(article.itemId == "2298")
        #expect(article.part == nil)
        #expect(article.quality == nil)
        #expect(article.itemLength == nil)
    }
    
    @Test("Item length keeps its stored key 'length'")
    func itemLengthCodingKey() throws {
        let article = Article("40315", part: .head, itemLength: 1665)
        let data = try JSONEncoder().encode(article)
        let object = try #require(try JSONSerialization.jsonObject(with: data) as? [String: Any])
        
        #expect(object["length"] as? Double == 1665)
        #expect(object["itemLength"] == nil)
        
        let stored = Data(#"{"itemId":"40315","_part":"K","length":2200}"#.utf8)
        let decoded = try JSONDecoder().decode(Article.self, from: stored)
        #expect(decoded.itemLength == 2200)
    }
}
