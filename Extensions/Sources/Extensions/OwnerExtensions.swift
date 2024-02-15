//
//  OwnerExtensions.swift
//  
//
//  Created by Maxence Lanone on 15/01/2024.
//

import Foundation
import Model

extension Owner: Codable{
    var symbol: String{
        switch self {
        case .noOne:
            return " "
        case .player1:
            return "🟡"
        case .player2:
            return "🔴"
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .noOne:
            try container.encode("x")
        case .player1:
            try container.encode("1")
        case .player2:
            try container.encode("2")
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let ownerString = try container.decode(String.self)
        switch ownerString {
        case "x" : self = .noOne
        case "1" : self = .player1
        case "2" : self = .player2
        default: throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown owner")
        }
    }
}
