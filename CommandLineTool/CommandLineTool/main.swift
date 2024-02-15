//
//  main.swift
//  CommandLineTool
//
//  Created by Maxence Lanone on 15/01/2024.
//

import Foundation
import Model
import Extensions

//let cellJungle: Cell = Cell(ofType: .jungle)
//let cellTrap: Cell = Cell(ofType: .trap)
//let cellDen: Cell = Cell(ofType: .den)
//let cellWater: Cell = Cell(ofType: .water)
//
//// Creation des Pieces pour le player 1
//let lionP1 = Piece(withOwner: .player1, andAnimal: .lion)
//let dogP1 = Piece(withOwner: .player1, andAnimal: .dog)
//let catP1 = Piece(withOwner: .player1, andAnimal: .cat)
//let ratP1 = Piece(withOwner: .player1, andAnimal: .rat)
//let leopardP1 = Piece(withOwner: .player1, andAnimal: .leopard)
//let wolfP1 = Piece(withOwner: .player1, andAnimal: .wolf)
//let tigerP1 = Piece(withOwner: .player1, andAnimal: .tiger)
//let elephantP1 = Piece(withOwner: .player1, andAnimal: .elephant)
//
//// Creation des Pieces pour le player 2
//let lionP2 = Piece(withOwner: .player2, andAnimal: .lion)
//let dogP2 = Piece(withOwner: .player2, andAnimal: .dog)
//let catP2 = Piece(withOwner: .player2, andAnimal: .cat)
//let ratP2 = Piece(withOwner: .player2, andAnimal: .rat)
//let leopardP2 = Piece(withOwner: .player2, andAnimal: .leopard)
//let wolfP2 = Piece(withOwner: .player2, andAnimal: .wolf)
//let tigerP2 = Piece(withOwner: .player2, andAnimal: .tiger)
//let elephantP2 = Piece(withOwner: .player2, andAnimal: .elephant)
//
////Creation des Cells pour le player 1
//let cellLionP1 = Cell(ofType: .jungle,ownedBy: .player1, withPiece: lionP1)
//let cellTigerP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: tigerP1)
//let cellDogP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: dogP1)
//let cellCatP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: catP1)
//let cellRatP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: ratP1)
//let cellLeopardP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: leopardP1)
//let cellWolfP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: wolfP1)
//let cellElephantP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: elephantP1)
//
////Creation des Cells pour le player 2
//let cellLionP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: lionP2)
//let cellTigerP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: tigerP2)
//let cellDogP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: dogP2)
//let cellCatP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: catP2)
//let cellRatP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: ratP2)
//let cellLeopardP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: leopardP2)
//let cellWolfP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: wolfP2)
//let cellElephantP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: elephantP2)
//
//// Creation des differentes lignes
//var line1: [Cell] = [cellLionP1, cellJungle, cellTrap, cellDen, cellTrap, cellJungle, cellTigerP1]
//var line2: [Cell] = [cellJungle, cellDogP1, cellJungle, cellTrap, cellJungle, cellCatP1, cellJungle]
//var line3: [Cell] = [cellRatP1, cellJungle, cellLeopardP1, cellJungle, cellWolfP1, cellJungle, cellElephantP1]
//var line4: [Cell] = [cellJungle, cellWater, cellWater, cellJungle, cellWater, cellWater, cellJungle]
//var line5: [Cell] = [cellElephantP2, cellJungle, cellWolfP2, cellJungle,cellLeopardP2 , cellJungle, cellRatP2]
//var line6: [Cell] = [cellJungle, cellCatP2, cellJungle, cellTrap, cellJungle, cellDogP2 , cellJungle]
//var line7: [Cell] = [cellTigerP2, cellJungle, cellTrap, cellDen, cellTrap, cellJungle, cellLionP2]
//
//
//// Creation de la grille avec les différentes lignes
//var grid : [[Cell]] = [line1, line2, line3, line4, line4, line4, line4, line5, line6, line7]

//if var board = Board(withGrid: grid){
//    ///Affichage de la planche de jeu
//    print(board.display)
//    
//    ///Test comptage des pieces du player1
//    let nbPieceP1 = board.countPieces(of: .player1)
//    print(nbPieceP1)
//    
//    ///Test comptage des pieces du player2
//    let nbPieceAll = board.countPieces()
//    print("Player1 : \(nbPieceAll.0) piece\nPlayer2 : \(nbPieceAll.1) piece")
//    
//    ///Test supression pièce avec row=2 et column= 2 and result = ok
//    var resultRemove = board.removePiece(atRow: 2, andColumn: 2)
//    print(resultRemove)
//    print(board.display)
//    
//    ///Test ajout pièce avec row= 2 et column=2 and result = ok
//    var pieceToAdd = Piece(withOwner: .player1, andAnimal: .leopard)
//    var resultAdd = board.insert(pieceToAdd, atRow: 2, andColumn: 2)
//    print(resultAdd)
//    print(board.display)
//    
//    ///Test ajout pièce avec row= 2 et column=2 and result = cellNotEmpty
//    resultAdd = board.insert(pieceToAdd, atRow: 2, andColumn: 2)
//    print(resultAdd)
//}

var rule : VerySimpleRules = VerySimpleRules()
var board = VerySimpleRules.createBoard()

/// Method to keep input of a human player
/// - Parameter player: The player we want his move
/// - Returns: A move with coordonate given by a human
func inputForHumanPlayer(player: HumanPlayer) -> Move? {
    print("Choose one row")
    guard let choiceRow = readLine() else{
        return nil
    }
    print("Choose one column")
    guard let choiceColumn = readLine() else{
        return nil
    }
    print("Choose row destination")
    guard let choiceDestinationRow = readLine() else{
        return nil
    }
    print("Choose column destination")
    guard let choiceDestinationColumn = readLine() else{
        return nil
    }
    if choiceRow.isEmpty || choiceColumn.isEmpty || choiceDestinationRow.isEmpty || choiceDestinationColumn.isEmpty {
        return nil
    }
    guard let rowInit = Int(choiceRow), let colInit = Int(choiceColumn),let rowDest = Int(choiceDestinationRow),let colDest = Int(choiceDestinationColumn) else{
        return nil
    }
    return Move(owner: player.id, rowOrigin: rowInit, colomnOrigin: colInit, rowDestination: rowDest, columnDestination: colDest)
}

var player = HumanPlayer(withName: "jax", andId: .player1, andInputMethod: inputForHumanPlayer)
var player3 = HumanPlayer(withName: "mama", andId: .player2, andInputMethod: inputForHumanPlayer)
var player2 = RandomPlayer(withName: "toto", andId: .player2)

var gameResult : (Bool, Result) = (false, .notFinished)

public func getPlayer() -> Player{
    if rule.getNextPlayer() == .player1 {
        return player!
    } else {
        return player2!
    }
}

//print(board.display)
//while rule.historic.isEmpty || !rule.isGameOver(board: board, withLastRow: rule.historic.last!.rowDestination, andLastColumn: rule.historic.last!.columnDestination).0 {
//    var actualPlayer = rule.getNextPlayer()
//    print(actualPlayer.description)
//    var move : Move? = getPlayer().chooseMove(in: board, with: rule)
//    while let playMove = move, !rule.isMoveValid(board: board, canMove: playMove){
//        move = getPlayer().chooseMove(in: board, with: rule)
//    }
//    if let playMove = move {
//        if let piece = board.grid[playMove.rowOrigin][playMove.colomnOrigin].piece {
//            var result = board.removePiece(atRow: playMove.rowDestination, andColumn: playMove.columnDestination)
//            result = board.removePiece(atRow: playMove.rowOrigin, andColumn: playMove.colomnOrigin)
//            result = board.insert(piece, atRow: playMove.rowDestination, andColumn: playMove.columnDestination)
//            rule.playedMove(move: playMove, boardBefore: board, boardAfter: board)
//        }
//        
//    }
//    print(board.display)
//}

var game: Game = try Game(withRules: rule, andPlayer1: player!, andPlayer2: player2!)

/// Method to print the board
/// - Parameter board: actual board
func displayBoard(board: Board){
    print(board.display)
}
/// Method when start the game display message
func startGame() {
    print("**************************************")
    print("\t==>> GAME STARTS! <<==")
    print("**************************************")
}

/// Methods display who is the next player
/// - Parameter player: next player
func nextPlayer(player: Player){
    print("**************************************")
    print("Player \(player.id.description) - \(player.name), it's your turn !")
    print("**************************************")
}

/// Method display message each turn to say if is game over
/// - Parameter result: result of the game: not finish, win, even
func gameOver(result: Result){
    switch result {
    case .notFinished:
        print("Game is not over yet!")
    case .winner(_ : let owner, _ : let reason):
        print("**************************************")
        print("Game Over!!!")
        print("and the winner is ... player\(owner.description)")
        print("\(reason.description)")
        print("**************************************")
    case .even:
        print("**************************************")
        print("Game Over!!!")
        print("there is a tie between the two players.")
        print("**************************************")
    }
}
/// Method notify the board has been changed and display each turn the last move and the board
/// - Parameters:
///   - board: new board
///   - move: last move played
func boardChange(board: Board, move: Move){
    print("**************************************")
    print("the board has been changed !")
    print("last move : Origin: (\(move.rowOrigin),\(move.colomnOrigin)), Destination : (\(move.rowDestination),\(move.columnDestination))")
    print("new Board :")
    displayBoard(board: board)
    print("**************************************")
}
/// Method notify when a bad move has been given
/// - Parameter move: bad move
func badMove(move : Move){
    print("**************************************")
    print("Origin: (\(move.rowOrigin),\(move.colomnOrigin)), Destination : (\(move.rowDestination),\(move.columnDestination))")
    print("This move is not good retry !")
    print("**************************************")
}
/// Method notify when a the good move has been given
/// - Parameter move: good move
func moveIsChoose(move : Move){
    print("**************************************")
    print("Origin: (\(move.rowOrigin),\(move.colomnOrigin)), Destination : (\(move.rowDestination),\(move.columnDestination))")
    print("This move has been choosed")
    print("**************************************")
}
game.startGameListener(start: startGame)
game.displayBoardListener(board: displayBoard)
game.isGameOverListener(result: gameOver)
game.nextPlayerListener(player: nextPlayer)
game.badMoveListener(move: badMove)
game.chooseMoveListener(move: moveIsChoose)
game.boardChangedListener(change: boardChange)

game.start()




func testTp6(){
    ///test encode et decode animal
    let animal: Animal = .cat

    MyFileManager.save(object: animal, to: "Animal.json")

    let animal2 = MyFileManager.load(from: "Animal.json", as: Animal.self)

    print(animal2!)

    ///test encode et decode owner
    let owner: Owner = .player1
    MyFileManager.save(object: owner, to: "Owner.json")

    let owner2 = MyFileManager.load(from: "Owner.json", as: Owner.self)

    print(owner2!)

    ///test encode et decode cell type
    let cellType: CellType = .den
    MyFileManager.save(object: cellType, to: "CellType.json")

    let cellType2 = MyFileManager.load(from: "CellType.json", as: CellType.self)

    print(cellType2!)

    ///test encode et decode piece
    let piece: Piece = Piece(withOwner: owner, andAnimal: animal)
    MyFileManager.save(object: piece, to: "Piece.json")

    let piece2 = MyFileManager.load(from: "Piece.json", as: Piece.self)

    print(piece2!)

    ///test encode et decode Move
    let move: Move = Move(owner: owner, rowOrigin: 1, colomnOrigin: 1, rowDestination: 1, columnDestination: 2)
    MyFileManager.save(object: move, to: "Move.json")

    let move2 = MyFileManager.load(from: "Move.json", as: Move.self)

    print(move2!)

    ///test encode et decode Cell
    let cell: Cell = Cell(ofType: cellType, ownedBy: owner, withPiece: piece)
    MyFileManager.save(object: cell, to: "Cell.json")

    let cell2 = MyFileManager.load(from: "Cell.json", as: Cell.self)

    print(cell2!)

    ///test encode et decode Cell without piece
    let cell3: Cell = Cell(ofType: .jungle, ownedBy: .player1)
    MyFileManager.save(object: cell3, to: "Cell.json")

    let cell4 = MyFileManager.load(from: "Cell.json", as: Cell.self)

    print(cell4!.description)

    ///test encode et decode Board
    if let board: Board = Board(withGrid: [[cell]]) {
        MyFileManager.save(object: board, to: "Board.json")
    }

    let board2 = MyFileManager.load(from: "Board.json", as: Board.self)

    print(board2!.display)
}

///uncomment this line to execute the test for tp6
//testTp6()

