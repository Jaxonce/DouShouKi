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
    
    public init?(withName name: String ,andId id: Owner) {
        self.id = id
        self.name = name
    }
    
    public func chooseMove(in board: Board, with rules: Rules) -> Move?{
        return nil
    }
}
