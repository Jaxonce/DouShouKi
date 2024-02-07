//
//  HumanPlayer.swift
//  
//
//  Created by Maxence Lanone on 29/01/2024.
//

import Foundation

public class HumanPlayer: Player {
    public var input : (HumanPlayer) -> Move?
    
    public init?(withName name: String, andId id: Owner, andInputMethod inputMethod: @escaping (HumanPlayer) -> Move?) {
        self.input = inputMethod
        super.init(withName: name, andId: id)
    }
    
    public override func chooseMove(in board: Board, with rules: Rules) -> Move? {
        let move = input(self)
        guard let validMove = move, rules.isMoveValid(board: board, canMove: validMove) else{
            return nil
        }
        return move
    }
    
    
    
    
}
