//
//  EnumParameters.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 19/06/2026.
//

import Foundation

public struct EnumParameters {
    
    public let enumId: String
    public let enumParameters: [EnumParameter]
    
    public init(_ enumId: String, _ parameters: EnumParameter...) {
        self.enumId = enumId
        self.enumParameters = parameters
    }
    
    public struct EnumParameter {
        public let parameter: String
        public let value: String
        
        public init(_ parameter: String, value: String) {
            self.parameter = parameter
            self.value = value
        }
        
        public init<Value: LosslessStringConvertible>(_ parameter: String, value: Value) {
            self.parameter = parameter
            self.value = value.description
        }
        
        public init<Value: IDExtractable>(_ value: Value) {
            self.parameter = String(describing: Value.self)
            self.value = value.id.description
        }
        
        public static func parameter<Value: IDExtractable>(_ value: Value) -> Self {
            .init(value)
        }
    }
}

extension EnumParameters: IDExtractable {
    
    public var id: String {
        enumId + "&" + enumParameters.map({ "\($0.parameter)=\($0.value)" }).joined(separator: ",")
    }
    
    public init?(id: String) {
        guard !id.isEmpty else { return nil }
        
        let parts = id.components(separatedBy: "&")
        guard let enumId = parts.first else { return nil }
        
        var enumParameters: [EnumParameter] = []
        for part in parts.dropFirst() {
            for parameter in part.components(separatedBy: ",") {
                let enumParameter = parameter.components(separatedBy: "=")
                if enumParameter.count == 2 {
                    enumParameters.append(EnumParameter(enumParameter[0], value: enumParameter[1]))
                }
            }
        }
        
        self.enumId = enumId
        self.enumParameters = enumParameters
    }
}

public extension EnumParameters {
    
    func matchesEnumId(_ id: String) -> Bool {
        enumId == id
    }
    
    func parameter(for parameter: String) -> EnumParameter? {
        enumParameters.first(where: { $0.parameter == parameter })
    }
    
    func parameter<Value: IDExtractable>(_ type: Value.Type = Value.self) -> Value? {
        let parameter = String(describing: Value.self)
        
        guard let rawValue = self.parameter(for: parameter)?.value,
              let id = Value.ID(rawValue)
        else {
            return nil
        }
        
        return Value(id: id)
    }
    
    func value<Value: LosslessStringConvertible>(for parameter: String, as type: Value.Type = Value.self) -> Value? {
        guard let rawValue = self.parameter(for: parameter)?.value else { return nil }
        return Value(rawValue)
    }
}
