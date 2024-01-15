//
//  AnimalExtensions.swift
//  
//
//  Created by Maxence Lanone on 15/01/2024.
//

import Foundation
import Model

public extension Animal{
    var description: String{
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
}
