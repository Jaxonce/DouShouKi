// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import Model

public extension CellType{
    public var description: String {
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
}
