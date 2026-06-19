//
//  EnumParametersTests.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 19/06/2026.
//

import Testing
@testable import FunicoKit

struct EnumParametersTests {
    
    enum TestType: IDExtractable {
        
        case type1
        case type2
        
        var id: Int {
            switch self {
            case .type1: 1
            case .type2: 2
            }
        }
        
        init?(id: Int) {
            switch id {
            case 1: self = .type1
            case 2: self = .type2
            default: return nil
            }
        }
    }
    
    enum TestEnum: RawRepresentable {
        
        case testCase1(TestType)
        case testCase2(TestType)
        case testCase3
        
        init?(rawValue: String) {
            if let enumParameters = EnumParameters(id: rawValue) {
                switch enumParameters.enumId {
                case "MLJAOAY54F":
                    guard let testType: TestType = enumParameters.parameter() else { return nil }
                    self = .testCase1(testType)
                case "EDDK3Q106S":
                    guard let testType: TestType = enumParameters.parameter() else { return nil }
                    self = .testCase2(testType)
                case "NL4QQE6WFC":
                    self = .testCase3
                default:
                    return nil
                }
            } else {
                return nil
            }
        }
        
        var rawValue: String {
            switch self {
            case .testCase1(let testType): EnumParameters("MLJAOAY54F", .parameter(testType)).id
            case .testCase2(let testType): EnumParameters("EDDK3Q106S", .parameter(testType)).id
            case .testCase3: "NL4QQE6WFC"
            }
        }
    }
    
    @Test("Id for TestEnum 'testCase1'")
    func id_testCase1() {
        let testCase: TestEnum = .testCase1(.type1)
        
        #expect(testCase.rawValue == "MLJAOAY54F&TestType=1")
    }
    
    @Test("Id for TestEnum 'testCase2'")
    func id_testCase2() {
        let testCase: TestEnum = .testCase2(.type2)
        
        #expect(testCase.rawValue == "EDDK3Q106S&TestType=2")
    }
    
    @Test("Id for TestEnum 'testCase3'")
    func id_testCase3() {
        let testCase: TestEnum = .testCase3
        
        #expect(testCase.rawValue == "NL4QQE6WFC")
    }
    
    @Test("Init TestEnum 'testCase1' from rawValue")
    func init_testCase1_fromRawValue() {
        let testCase = TestEnum(rawValue: "MLJAOAY54F&TestType=1")
        
        #expect(testCase?.rawValue == TestEnum.testCase1(.type1).rawValue)
    }
    
    @Test("Init TestEnum 'testCase2' from rawValue")
    func init_testCase2_fromRawValue() {
        let testCase = TestEnum(rawValue: "EDDK3Q106S&TestType=2")
        
        #expect(testCase?.rawValue == TestEnum.testCase2(.type2).rawValue)
    }
    
    @Test("Init TestEnum 'testCase3' from rawValue")
    func init_testCase3_fromRawValue() {
        let testCase = TestEnum(rawValue: "NL4QQE6WFC")
        
        #expect(testCase?.rawValue == TestEnum.testCase3.rawValue)
    }
    
    @Test("Invalid enum id returns nil")
    func invalidEnumId_returnsNil() {
        let testCase = TestEnum(rawValue: "INVALID&TestType=1")
        
        #expect(testCase == nil)
    }
    
    @Test("Invalid parameter value returns nil")
    func invalidParameterValue_returnsNil() {
        let testCase = TestEnum(rawValue: "MLJAOAY54F&TestType=999")
        
        #expect(testCase == nil)
    }
}
