//
//  Rules.swift
//
//
//  Created by Maxence Lanone on 22/01/2024.
//

import Foundation

public protocol Rules {
    var occurences: (Board, Int) { get set }
    var historic: [Move] {get set}
    
    static func createBoard() -> Board
    static func checkBoard(b: Board)
    func getNextPlayer() -> Owner
    func getMoves(_ board: Board, _ owner: Owner) -> [Move]
    func getMoves(_ board: Board, _ owner: Owner, withRaw row: Int, andColumn column: Int) -> [Move]
    func isMoreValid(_ board: Board, initialRow :Int, initialColumn :Int, destinationRow :Int, destinationColumn:Int) -> Bool
    func isMoreValid(_ board: Board, canMove move: Move) -> Bool
    func isGameOver(_ board: Board, withLastRow row: Int, andLastColumn column: Int) -> (Bool, Result)
    func playedMove(_ move: Move, boardBefore: Board, boardAfter: Board)
}
