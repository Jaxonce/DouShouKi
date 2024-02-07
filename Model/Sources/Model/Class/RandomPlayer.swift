//
//  RandomPlayer.swift
//  
//
//  Created by Maxence Lanone on 29/01/2024.
//

import Foundation

public class RandomPlayer: Player{
    public override init?(withName name: String, andId id: Owner) {
        super.init(withName: name, andId: id)
    }
    
    public override func chooseMove(in board: Board, with rules: Rules) -> Move? {
        rules.getMoves(board: board, owner: id).randomElement()
    }
}
