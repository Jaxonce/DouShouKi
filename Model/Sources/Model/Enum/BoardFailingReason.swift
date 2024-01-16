//
//  BoardFailingReason.swift
//
//
//  Created by Maxence Lanone on 16/01/2024.
//

import Foundation

public enum BoardFailingReason {
    case outOfBounds, cellNotEmpty, cellEmpty, unknown
    
    ///Verif car quand je print le result dans les tests ca utilise pas description
    public var description: String{
        switch self{
        case .cellEmpty:
            return "La cellule est déja vide"
        case .cellNotEmpty:
            return "La cellule n'est pas vide"
        case .outOfBounds:
            return "La cellule est dehors de la board"
        case .unknown:
            return "Inconnue"
        }
    }
}
