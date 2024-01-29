//
//  Rules.swift
//
//
//  Created by Maxence Lanone on 22/01/2024.
//

import Foundation

public protocol Rules {
    var occurences: [Board : Int] { get set }
    var historic: [Move] {get set}
    
    static func createBoard() -> Board
    static func checkBoard(b: Board) throws
    func getNextPlayer() -> Owner
    func getMoves(board: Board, owner: Owner) -> [Move]
    func getMoves(board: Board, owner: Owner, withRaw row: Int, andColumn column: Int) -> [Move]
    func isMoveValid(board: Board, initialRow :Int, initialColumn :Int, destinationRow :Int, destinationColumn:Int) -> Bool
    func isMoveValid(board: Board, canMove move: Move) -> Bool
    func isGameOver(board: Board, withLastRow row: Int, andLastColumn column: Int) -> (Bool, Result)
    mutating func playedMove(move: Move, boardBefore: Board, boardAfter: Board)
}
