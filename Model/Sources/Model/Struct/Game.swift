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
    
    /// Ctor to create the game and init the board with specific rule
    /// - Parameters:
    ///   - rule: rule use for the game
    ///   - player1: the player1
    ///   - player2: the player2
    public init(withRules rule: Rules,andPlayer1 player1: Player,andPlayer2 player2: Player) throws{
        self.player1 = player1
        self.player2 = player2
        if (player1.id == player2.id) {
            throw GameError.badPlayerId(id: "Bad id : \(player1.id)")
        }
        self.rule = rule
        self.board = VerySimpleRules.createBoard()
//        if self.rule is VerySimpleRules {
//            self.board = VerySimpleRules.createBoard()
//        } else {
////            self.board = ClassicRules.createBoard()
//        }
        
    }
    
    /// Get the player from the owner
    /// - Returns: or the player1, or the player2
    public func getPlayer() throws -> Player{
        switch rule.getNextPlayer() {
        case .noOne:
            throw GameError.nextPlayerError
        case .player1:
            return player1
        case .player2:
            return player2
        }
    }
    
    /// Method use to start the game and execute the boucle game
    public mutating func start(){
        startGameCallBacks()
        var gameResult : (Bool,Result)
        while rule.historic.isEmpty || !rule.isGameOver(board: board, withLastRow: rule.historic.last!.rowDestination, andLastColumn: rule.historic.last!.columnDestination).0 {
            var actualPlayer = try! getPlayer()
            nextPlayerCallBacks(player: actualPlayer)
            var move : Move? = actualPlayer.chooseMove(in: board, with: rule)
            while let playMove = move, !rule.isMoveValid(board: board, canMove: playMove){
                badMoveCallBacks(move: playMove)
                move = actualPlayer.chooseMove(in: board, with: rule)
            }
            chooseMoveCallBacks(move: move!)
            if let playMove = move {
                if let piece = board.grid[playMove.rowOrigin][playMove.colomnOrigin].piece {
                    var result = board.removePiece(atRow: playMove.rowDestination, andColumn: playMove.columnDestination)
                    result = board.removePiece(atRow: playMove.rowOrigin, andColumn: playMove.colomnOrigin)
                    result = board.insert(piece, atRow: playMove.rowDestination, andColumn: playMove.columnDestination)
                    rule.playedMove(move: playMove, boardBefore: board, boardAfter: board)
                    boardChangedCallBacks(board: board, move: playMove)
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
    var chooseMoveCollection : [((Move)->Void)] = []
    
    public mutating func chooseMoveListener(move: @escaping(Move)-> Void){
        self.chooseMoveCollection.append(move)
    }
    
    private func chooseMoveCallBacks(move: Move){
        chooseMoveCollection.forEach({$0(move)})
    }
    
    var badMoveCollection : [((Move)->Void)] = []
    
    public mutating func badMoveListener(move: @escaping(Move)-> Void){
        self.badMoveCollection.append(move)
    }
    
    private func badMoveCallBacks(move: Move){
        badMoveCollection.forEach({$0(move)})
    }
    
    var boardChangedCollection : [((Board, Move)->Void)] = []
    
    public mutating func boardChangedListener(change: @escaping(Board, Move)-> Void){
        self.boardChangedCollection.append(change)
    }
    
    private func boardChangedCallBacks(board:Board, move: Move){
        boardChangedCollection.forEach({$0(board, move)})
    }
}
