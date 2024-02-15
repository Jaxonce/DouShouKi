// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import Model

extension CellType: Codable{
     var symbol: String {
        switch self {
        case .den:
            return "🪹"
        case .jungle:
            return "🌿"
        case .trap:
            return "🪤"
        case .water:
            return "💧"
        case .unknown:
            return " "
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let cellTypeString = try container.decode(String.self)
        switch cellTypeString {
        case "den": self = .den
        case "jungle": self = .jungle
        case "trap": self = .trap
        case "water": self = .water
        case "unkwown": self = .unknown
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown cell type")
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .unknown:
            try container.encode("unknown")
        case .jungle:
            try container.encode("jungle")
        case .water:
            try container.encode("water")
        case .trap:
            try container.encode("trap")
        case .den:
            try container.encode("den")
        }
    }

}
