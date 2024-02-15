//
//  File.swift
//  
//
//  Created by Maxence Lanone on 16/02/2024.
//

import Foundation
import Model

extension VerySimpleRules: Codable{
    private enum CodingKeys: CodingKey{
        case occurences
        case historic
    }
    
    /// Init to decode a VerySimpleRules
    /// - Parameter decoder: the decoder use to decode a Rules
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let historicDecode = try container.decode([Move].self, forKey: .historic)
        let occurencesDecode = try container.decode([Board: Int].self, forKey: .occurences)
        ///Problem because this init hasn't param
        self.init()
    }
    
    
    /// Enable to encode a Rule in Json
    /// - Parameter encoder: the encoder use to encode a Rules
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(occurences.self, forKey: .occurences)
        try container.encode(historic, forKey: .historic)
    }
}
