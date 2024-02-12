//
//  Player.swift
//
//
//  Created by Maxence Lanone on 29/01/2024.
//

import Foundation

public class Player {
    public let id : Owner
    public let name: String
    
    /// Ctor
    /// - Parameters:
    ///   - name: name of the player : example "Jax"
    ///   - id: which owner is the player
    public init?(withName name: String ,andId id: Owner) {
        self.id = id
        self.name = name
    }
    
    /// Enable to choose a move in a game
    /// - Parameters:
    ///   - board: board of the game
    ///   - rules: rule use for the game
    /// - Returns: The choosen moven
    public func chooseMove(in board: Board, with rules: Rules) -> Move?{
        return nil
    }
}
