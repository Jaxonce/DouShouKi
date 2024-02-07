//
//  File.swift
//  
//
//  Created by Maxence Lanone on 07/02/2024.
//

import Foundation

public struct Game {
    public var board: Board
    public var player1: Player
    public var player2: Player
    public var rule: Rules
    
    public init(withRules rule: Rules,andPlayer1 player1: Player,andPlayer2 player2: Player) {
        self.player1 = player1
        self.player2 = player2
        self.rule = rule
        self.board = VerySimpleRules.createBoard()
//        if self.rule is VerySimpleRules {
//            self.board = VerySimpleRules.createBoard()
//        } else {
////            self.board = ClassicRules.createBoard()
//        }
        
    }
    
    public func getPlayer() -> Player{
        if rule.getNextPlayer() == .player1 {
            return player1
        } else {
            return player2
        }
    }
    
    public mutating func start(){
        startGameCallBacks()
        var gameResult : (Bool,Result)
        while rule.historic.isEmpty || !rule.isGameOver(board: board, withLastRow: rule.historic.last!.rowDestination, andLastColumn: rule.historic.last!.columnDestination).0 {
            var actualPlayer = rule.getNextPlayer()
            nextPlayerCallBacks(player: getPlayer())
            var move : Move? = getPlayer().chooseMove(in: board, with: rule)
            while let playMove = move, !rule.isMoveValid(board: board, canMove: playMove){
                move = getPlayer().chooseMove(in: board, with: rule)
            }
            if let playMove = move {
                if let piece = board.grid[playMove.rowOrigin][playMove.colomnOrigin].piece {
                    var result = board.removePiece(atRow: playMove.rowDestination, andColumn: playMove.columnDestination)
                    result = board.removePiece(atRow: playMove.rowOrigin, andColumn: playMove.colomnOrigin)
                    result = board.insert(piece, atRow: playMove.rowDestination, andColumn: playMove.columnDestination)
                    rule.playedMove(move: playMove, boardBefore: board, boardAfter: board)
                    gameResult = rule.isGameOver(board: board, withLastRow: playMove.rowDestination, andLastColumn: playMove.columnDestination)
                    isGameOverCallBacks(result: gameResult.1)
                }
                
            }
            displayBoardCallBacks(board: board)
            
        }
    }
    
    var startCollection: [(() -> Void)] = []
    
    public mutating func startGameListener(start: @escaping() -> Void) {
        self.startCollection.append(start)
    }
    
    private func startGameCallBacks(){
        startCollection.forEach({$0()})
    }
    
    var nextPlayerCollection: [((Player) -> Void)] = []
    
    public mutating func nextPlayerListener(player: @escaping (Player) -> Void) {
        self.nextPlayerCollection.append(player)
    }
    
    private func nextPlayerCallBacks(player: Player) {
        nextPlayerCollection.forEach({$0(player)})
    }
    
    var isGameOverCollection: [((Result) -> Void)] = []
    
    public mutating func isGameOverListener(result: @escaping (Result) -> Void) {
        self.isGameOverCollection.append(result)
    }
    
    private func isGameOverCallBacks(result: Result) {
        isGameOverCollection.forEach({$0(result)})
    }
    
    var displayBoardCollection: [((Board) -> Void)] = []
    
    public mutating func displayBoardListener(board: @escaping(Board) -> Void) {
        self.displayBoardCollection.append(board)
    }
    
    private func displayBoardCallBacks(board: Board){
        displayBoardCollection.forEach({$0(board)})
    }
}
