//
//  ProfileTests.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 22/05/2026.
//

import Testing
@testable import FunicoERP

struct ProfileTests {
    
    @Test("Profile from name for article '50398'")
    func profileFromName_50398() {
        let articleName = "5PRF.LST.SIERPANEEL.EIK FRANS.2150X145X12"
        let profile = Profile(name: articleName)
        
        #expect(profile == .lijst)
    }
}
