//
//  ArticleTests.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 21/01/2026.
//

import Testing
@testable import FunicoCore

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
        #expect(article.length == nil)
    }
    
    @Test("Initialize from string literal '40288RD-A'")
    func initializeStringLiteral_40288RD_A() {
        let article: Article = "40288RD-A"
        
        #expect(article.itemId == "40288")
        #expect(article.part == .rthigh)
        #expect(article.quality == .A)
        #expect(article.length == nil)
    }
    
    @Test("Initialize from string literal '60150 | 1665'")
    func initializeStringLiteral_60150_1665() {
        let article: Article = "60150 | 1665"
        
        #expect(article.itemId == "60150")
        #expect(article.part == nil)
        #expect(article.quality == nil)
        #expect(article.length == 1665)
    }
    
    @Test("Initialize from string literal '60220-RA | 2200'")
    func initializeStringLiteral_60220_RA_2200() {
        let article: Article = "60220-RA | 2200"
        
        #expect(article.itemId == "60220")
        #expect(article.part == nil)
        #expect(article.quality == .RA)
        #expect(article.length == 2200)
    }
    
    @Test("Initialize from integer literal '2298'")
    func initializeIntegerLiteral_2298() {
        let article: Article = 2298
        
        #expect(article.itemId == "2298")
        #expect(article.part == nil)
        #expect(article.quality == nil)
        #expect(article.length == nil)
    }
}
