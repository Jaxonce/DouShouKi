//
//  AnimalExtensions.swift
//  
//
//  Created by Maxence Lanone on 15/01/2024.
//

import Foundation
import Model

extension Animal: Codable{
    var symbol: String{
        switch self {
        case .rat:
            return "🐭"
        case .cat:
            return "🐱"
        case .dog:
            return "🐶"
        case .lion:
            return "🦁"
        case .elephant:
            return "🐘"
        case .tiger:
            return "🐯"
        case .wolf:
            return "🐺"
        case .leopard:
            return "🐆"
        }
    }
    
    /// Enable to encode an Animal in Json
    /// - Parameter encoder: the encoder use to encode an Animal
    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .rat: try container.encode("rat")
            case .cat: try container.encode("cat")
            case .dog: try container.encode("dog")
            case .wolf: try container.encode("wolf")
            case .leopard: try container.encode("leopard")
            case .tiger: try container.encode("tiger")
            case .lion: try container.encode("lion")
            case .elephant: try container.encode("elephant")
            }
        }
    
    /// Init to keep a json an animal and create an Animal
    /// - Parameter decoder: the decoder use to transform the animal
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let animalString = try container.decode(String.self)
        switch animalString {
        case "rat": self = .rat
        case "cat": self = .cat
        case "dog": self = .dog
        case "wolf": self = .wolf
        case "leopard": self = .leopard
        case "tiger": self = .tiger
        case "lion": self = .lion
        case "elephant": self = .elephant
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown animal")
        }
    }
}
