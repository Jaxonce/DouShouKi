//
//  VerySimpleRules.swift
//
//
//  Created by Maxence Lanone on 22/01/2024.
//

import Foundation

struct VerySimpleRules: Rules {
    var occurences: (Board, Int)
    
    var historic: [Move]
    
    static func createBoard() -> Board {
        <#code#>
    }
    
    static func checkBoard(b: Board) {
        <#code#>
    }
    
    func getNextPlayer() -> Owner {
        <#code#>
    }
    
    func getMoves(_: Board, _: Owner) -> [Move] {
        <#code#>
    }
    
    func getMoves(_: Board, _: Owner, withRaw _: Int, andColumn _: Int) -> [Move] {
        <#code#>
    }
    
    func isMoreValid(_: Board, initialRow _: Int, initialColumn _: Int, destinationRow _: Int, destinationColumn _: Int) -> Bool {
        <#code#>
    }
    
    func isMoreValid(_: Board, canMove _: Move) -> Bool {
        <#code#>
    }
    
    func isGameOver(_: Board, withLastRow _: Int, andLastColumn _: Int) -> (Bool, Result) {
        <#code#>
    }
    
    func playedMove(_: Move, boardBefore _: Board, boardAfter _: Board) {
        <#code#>
    }
    
    
}
