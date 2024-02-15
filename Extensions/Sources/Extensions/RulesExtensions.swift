//
//  File.swift
//  
//
//  Created by Maxence Lanone on 15/02/2024.
//

import Foundation
import Model

extension Rules where Self: Codable{
    public func encode(to encoder: Encoder) throws{
        var container = encoder.singleValueContainer()
        try container.encode(self)
    }
    
    public init(from decoder: Decoder) throws{
        let container = try decoder.singleValueContainer()
        self = try container.decode(Self.self)
    }
}
