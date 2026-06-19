//
//  EnumParameters.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 19/06/2026.
//

import Foundation

public struct EnumParameters {
    
    private var enumId: String
    private var enumParameters: [EnumParameter]
    
    public init(_ enumId: String, parameters: EnumParameter...) {
        self.enumId = enumId
        self.enumParameters = parameters
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
    
    public struct EnumParameter {
        internal var parameter: String
        internal var value: String
        
        public init(_ parameter: String, value: String) {
            self.parameter = parameter
            self.value = value
        }
    }
}

extension EnumParameters: Identifiable {
    
    public var id: String {
        enumId + "&" + enumParameters.map({ "\($0.parameter)=\($0.value)" }).joined(separator: ",")
    }
}

public extension EnumParameters {
    
    func matchesEnumId(_ id: String) -> Bool {
        enumId == id
    }
    
    func parameter(for parameter: String) -> EnumParameter? {
        enumParameters.first(where: { $0.parameter == parameter })
    }
}
