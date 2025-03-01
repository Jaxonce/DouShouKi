//
//  BoardPerformanceTests.swift
//  
//
//  Created by Maxence Lanone on 17/01/2024.
//

import XCTest
import Model

final class BoardPerformanceTests: XCTestCase {
    
    var board: Board?

    override func setUp() {
        let cellJungle: Cell = Cell(ofType: .jungle)
        let cellTrap: Cell = Cell(ofType: .trap)
        let cellDen: Cell = Cell(ofType: .den)
        let cellWater: Cell = Cell(ofType: .water)

        // Creation des Pieces pour le player 1
        let lionP1 = Piece(withOwner: .player1, andAnimal: .lion)
        let dogP1 = Piece(withOwner: .player1, andAnimal: .dog)
        let catP1 = Piece(withOwner: .player1, andAnimal: .cat)
        let ratP1 = Piece(withOwner: .player1, andAnimal: .rat)
        let leopardP1 = Piece(withOwner: .player1, andAnimal: .leopard)
        let wolfP1 = Piece(withOwner: .player1, andAnimal: .wolf)
        let tigerP1 = Piece(withOwner: .player1, andAnimal: .tiger)
        let elephantP1 = Piece(withOwner: .player1, andAnimal: .elephant)

        // Creation des Pieces pour le player 2
        let lionP2 = Piece(withOwner: .player2, andAnimal: .lion)
        let dogP2 = Piece(withOwner: .player2, andAnimal: .dog)
        let catP2 = Piece(withOwner: .player2, andAnimal: .cat)
        let ratP2 = Piece(withOwner: .player2, andAnimal: .rat)
        let leopardP2 = Piece(withOwner: .player2, andAnimal: .leopard)
        let wolfP2 = Piece(withOwner: .player2, andAnimal: .wolf)
        let tigerP2 = Piece(withOwner: .player2, andAnimal: .tiger)
        let elephantP2 = Piece(withOwner: .player2, andAnimal: .elephant)

        //Creation des Cells pour le player 1
        let cellLionP1 = Cell(ofType: .jungle,ownedBy: .player1, withPiece: lionP1)
        let cellTigerP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: tigerP1)
        let cellDogP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: dogP1)
        let cellCatP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: catP1)
        let cellRatP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: ratP1)
        let cellLeopardP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: leopardP1)
        let cellWolfP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: wolfP1)
        let cellElephantP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: elephantP1)

        //Creation des Cells pour le player 2
        let cellLionP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: lionP2)
        let cellTigerP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: tigerP2)
        let cellDogP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: dogP2)
        let cellCatP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: catP2)
        let cellRatP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: ratP2)
        let cellLeopardP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: leopardP2)
        let cellWolfP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: wolfP2)
        let cellElephantP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: elephantP2)

        // Creation des differentes lignes
        let line1: [Cell] = [cellLionP1, cellJungle, cellTrap, cellDen, cellTrap, cellJungle, cellTigerP1]
        let line2: [Cell] = [cellJungle, cellDogP1, cellJungle, cellTrap, cellJungle, cellCatP1, cellJungle]
        let line3: [Cell] = [cellRatP1, cellJungle, cellLeopardP1, cellJungle, cellWolfP1, cellJungle, cellElephantP1]
        let line4: [Cell] = [cellJungle, cellWater, cellWater, cellJungle, cellWater, cellWater, cellJungle]
        let line5: [Cell] = [cellElephantP2, cellJungle, cellWolfP2, cellJungle,cellLeopardP2 , cellJungle, cellRatP2]
        let line6: [Cell] = [cellJungle, cellCatP2, cellJungle, cellTrap, cellJungle, cellDogP2 , cellJungle]
        let line7: [Cell] = [cellTigerP2, cellJungle, cellTrap, cellDen, cellTrap, cellJungle, cellLionP2]


        // Creation de la grille avec les différentes lignes
        let grid : [[Cell]] = [line1, line2, line3, line4, line4, line4, line4, line5, line6, line7]
        
        board = Board(withGrid: grid)!

    }

    func testPerformance() throws {
        // This is an example of a performance test case.
        self.measure {
            _ = board?.removePiece(atRow: 0, andColumn: 0)
        }
    }

}
