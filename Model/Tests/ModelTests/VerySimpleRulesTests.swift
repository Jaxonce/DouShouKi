//
//  VerySimpleRulesTests.swift
//  
//
//  Created by Maxence Lanone on 23/01/2024.
//

import XCTest
import Model

final class VerySimpleRulesTests: XCTestCase {
    var board = VerySimpleRules.createBoard()
    var rule : Rules = VerySimpleRules()

    override func setUpWithError() throws {
        board = VerySimpleRules.createBoard()
    }

    override func tearDownWithError() throws {
        rule.historic = []
    }

    func testGoodDimensions() {
        XCTAssertNoThrow(try VerySimpleRules.checkBoard(b: board))
    }
    
    func testInvalidDimensions() {
        let cellJungle: Cell = Cell(ofType: .jungle)
        let cellDen1: Cell = Cell(ofType: .den, ownedBy: .player1)
        
        let lionP1 = Piece(withOwner: .player1, andAnimal: .lion)
        let tigerP1 = Piece(withOwner: .player1, andAnimal: .tiger)
        
        
        //Creation des Cells pour le player 1
        let cellLionP1 = Cell(ofType: .jungle,ownedBy: .player1, withPiece: lionP1)
        let cellTigerP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: tigerP1)
        
        let line1: [Cell] = [cellJungle,cellLionP1,cellDen1, cellTigerP1]
        
        let grid : [[Cell]] = [line1]
        let invalidBoard : Board = Board(withGrid: grid)!
        XCTAssertThrowsError(try VerySimpleRules.checkBoard(b: invalidBoard)) { error in
            XCTAssertTrue(error is InvalidBoardError)
            XCTAssertEqual(error as? InvalidBoardError, InvalidBoardError.badDimensions(5, 5))
        }
    }
    
    func testInvalidCellTypeFirstRow() {
        let cellJungle: Cell = Cell(ofType: .jungle)
        let cellDen2: Cell = Cell(ofType: .den, ownedBy: .player2)
        let invalidCell = Cell(ofType: .trap, ownedBy: .player1)
        
        let lionP1 = Piece(withOwner: .player1, andAnimal: .lion)
        let catP1 = Piece(withOwner: .player1, andAnimal: .cat)
        let ratP1 = Piece(withOwner: .player1, andAnimal: .rat)
        let tigerP1 = Piece(withOwner: .player1, andAnimal: .tiger)
        let elephantP1 = Piece(withOwner: .player1, andAnimal: .elephant)
        
        let lionP2 = Piece(withOwner: .player2, andAnimal: .lion)
        let catP2 = Piece(withOwner: .player2, andAnimal: .cat)
        let ratP2 = Piece(withOwner: .player2, andAnimal: .rat)
        let tigerP2 = Piece(withOwner: .player2, andAnimal: .tiger)
        let elephantP2 = Piece(withOwner: .player2, andAnimal: .elephant)
        
        //Creation des Cells pour le player 1
        let cellLionP1 = Cell(ofType: .jungle,ownedBy: .player1, withPiece: lionP1)
        let cellTigerP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: tigerP1)
        let cellCatP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: catP1)
        let cellRatP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: ratP1)
        let cellElephantP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: elephantP1)

        //Creation des Cells pour le player 2
        let cellLionP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: lionP2)
        let cellTigerP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: tigerP2)
        let cellCatP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: catP2)
        let cellRatP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: ratP2)
        let cellElephantP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: elephantP2)
        
        let line1: [Cell] = [cellJungle,cellLionP1,invalidCell, cellTigerP1, cellJungle]
        let line2: [Cell] = [cellRatP1,cellJungle,cellCatP1, cellJungle, cellElephantP1]
        let line3: [Cell] = [cellJungle,cellJungle,cellJungle, cellJungle, cellJungle]
        let line4: [Cell] = [cellElephantP2,cellJungle,cellCatP2, cellJungle, cellRatP2]
        let line5: [Cell] = [cellJungle,cellTigerP2,cellDen2, cellLionP2, cellJungle]
        
        let grid : [[Cell]] = [line1, line2, line3, line4, line5]
        let invalidBoard : Board = Board(withGrid: grid)!
        XCTAssertThrowsError(try VerySimpleRules.checkBoard(b: invalidBoard)) { error in
            XCTAssertTrue(error is InvalidBoardError)
            XCTAssertEqual(error as? InvalidBoardError, InvalidBoardError.badCellType(invalidCell.cellType, 0, 2))
        }
    }
    
    func testInvalidCellTypeLastRow() {
        let cellJungle: Cell = Cell(ofType: .jungle)
        let cellDen1: Cell = Cell(ofType: .den, ownedBy: .player1)
        let invalidCell = Cell(ofType: .trap, ownedBy: .player2)
        
        let lionP1 = Piece(withOwner: .player1, andAnimal: .lion)
        let catP1 = Piece(withOwner: .player1, andAnimal: .cat)
        let ratP1 = Piece(withOwner: .player1, andAnimal: .rat)
        let tigerP1 = Piece(withOwner: .player1, andAnimal: .tiger)
        let elephantP1 = Piece(withOwner: .player1, andAnimal: .elephant)
        
        let lionP2 = Piece(withOwner: .player2, andAnimal: .lion)
        let catP2 = Piece(withOwner: .player2, andAnimal: .cat)
        let ratP2 = Piece(withOwner: .player2, andAnimal: .rat)
        let tigerP2 = Piece(withOwner: .player2, andAnimal: .tiger)
        let elephantP2 = Piece(withOwner: .player2, andAnimal: .elephant)
        
        //Creation des Cells pour le player 1
        let cellLionP1 = Cell(ofType: .jungle,ownedBy: .player1, withPiece: lionP1)
        let cellTigerP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: tigerP1)
        let cellCatP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: catP1)
        let cellRatP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: ratP1)
        let cellElephantP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: elephantP1)

        //Creation des Cells pour le player 2
        let cellLionP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: lionP2)
        let cellTigerP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: tigerP2)
        let cellCatP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: catP2)
        let cellRatP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: ratP2)
        let cellElephantP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: elephantP2)
        
        let line1: [Cell] = [cellJungle,cellLionP1,cellDen1, cellTigerP1, cellJungle]
        let line2: [Cell] = [cellRatP1,cellJungle,cellCatP1, cellJungle, cellElephantP1]
        let line3: [Cell] = [cellJungle,cellJungle,cellJungle, cellJungle, cellJungle]
        let line4: [Cell] = [cellElephantP2,cellJungle,cellCatP2, cellJungle, cellRatP2]
        let line5: [Cell] = [cellJungle,cellTigerP2,invalidCell, cellLionP2, cellJungle]
        
        let grid : [[Cell]] = [line1, line2, line3, line4, line5]
        let invalidBoard : Board = Board(withGrid: grid)!
        XCTAssertThrowsError(try VerySimpleRules.checkBoard(b: invalidBoard)) { error in
            XCTAssertTrue(error is InvalidBoardError)
            XCTAssertEqual(error as? InvalidBoardError, InvalidBoardError.badCellType(invalidCell.cellType, invalidBoard.nbRow, 2))
        }
    }
    
    func testMultipleOccurrencesOfSamePiece() {
        let cellJungle: Cell = Cell(ofType: .jungle)
        let cellDen1: Cell = Cell(ofType: .den, ownedBy: .player1)
        let cellDen2 = Cell(ofType: .den, ownedBy: .player2)
        
        let lionP1 = Piece(withOwner: .player1, andAnimal: .lion)
        let catP1 = Piece(withOwner: .player1, andAnimal: .cat)
        let ratP1 = Piece(withOwner: .player1, andAnimal: .rat)
        let tigerP1 = Piece(withOwner: .player1, andAnimal: .tiger)
        let elephantP1 = Piece(withOwner: .player1, andAnimal: .elephant)
        
        let lionP2 = Piece(withOwner: .player2, andAnimal: .lion)
        let catP2 = Piece(withOwner: .player2, andAnimal: .cat)
        let ratP2 = Piece(withOwner: .player2, andAnimal: .rat)
        let tigerP2 = Piece(withOwner: .player2, andAnimal: .tiger)
        let elephantP2 = Piece(withOwner: .player2, andAnimal: .elephant)
        
        //Creation des Cells pour le player 1
        let cellLionP1 = Cell(ofType: .jungle,ownedBy: .player1, withPiece: lionP1)
        let cellTigerP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: tigerP1)
        let cellCatP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: catP1)
        let cellRatP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: ratP1)
        let cellElephantP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: elephantP1)

        //Creation des Cells pour le player 2
        let cellLionP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: lionP2)
        let cellTigerP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: tigerP2)
        let cellCatP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: catP2)
        let cellRatP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: ratP2)
        let cellElephantP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: elephantP2)
        
        let line1: [Cell] = [cellJungle,cellLionP1,cellDen1, cellLionP1, cellJungle]
        let line2: [Cell] = [cellRatP1,cellJungle,cellCatP1, cellJungle, cellElephantP1]
        let line3: [Cell] = [cellJungle,cellJungle,cellJungle, cellJungle, cellJungle]
        let line4: [Cell] = [cellElephantP2,cellJungle,cellCatP2, cellJungle, cellRatP2]
        let line5: [Cell] = [cellJungle,cellTigerP2,cellDen2, cellLionP2, cellJungle]
        
        let grid : [[Cell]] = [line1, line2, line3, line4, line5]
        let invalidBoard : Board = Board(withGrid: grid)!
        XCTAssertThrowsError(try VerySimpleRules.checkBoard(b: invalidBoard)) { error in
            XCTAssertTrue(error is InvalidBoardError)
            XCTAssertEqual(error as? InvalidBoardError, InvalidBoardError.multipleOccurencesOfSamePiece(cellLionP1.piece!))
        }
    }
    
    func testInvalidCellTypeInBoard() {
        let invalidCell = Cell(ofType: .water, ownedBy: .player2)
        
        
        let cellJungle: Cell = Cell(ofType: .jungle)
        let cellDen1: Cell = Cell(ofType: .den, ownedBy: .player1)
        let cellDen2 = Cell(ofType: .den, ownedBy: .player2)
        
        let lionP1 = Piece(withOwner: .player1, andAnimal: .lion)
        let catP1 = Piece(withOwner: .player1, andAnimal: .cat)
        let ratP1 = Piece(withOwner: .player1, andAnimal: .rat)
        let tigerP1 = Piece(withOwner: .player1, andAnimal: .tiger)
        let elephantP1 = Piece(withOwner: .player1, andAnimal: .elephant)
        
        let lionP2 = Piece(withOwner: .player2, andAnimal: .lion)
        let catP2 = Piece(withOwner: .player2, andAnimal: .cat)
        let ratP2 = Piece(withOwner: .player2, andAnimal: .rat)
        let tigerP2 = Piece(withOwner: .player2, andAnimal: .tiger)
        let elephantP2 = Piece(withOwner: .player2, andAnimal: .elephant)
        
        //Creation des Cells pour le player 1
        let cellLionP1 = Cell(ofType: .jungle,ownedBy: .player1, withPiece: lionP1)
        let cellTigerP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: tigerP1)
        let cellCatP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: catP1)
        let cellRatP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: ratP1)
        let cellElephantP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: elephantP1)

        //Creation des Cells pour le player 2
        let cellLionP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: lionP2)
        let cellTigerP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: tigerP2)
        let cellCatP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: catP2)
        let cellRatP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: ratP2)
        let cellElephantP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: elephantP2)
        
        let line1: [Cell] = [cellJungle,cellLionP1,cellDen1, cellTigerP1, cellJungle]
        let line2: [Cell] = [cellRatP1,invalidCell,cellCatP1, cellJungle, cellElephantP1]
        let line3: [Cell] = [cellJungle,cellJungle,cellJungle, cellJungle, cellJungle]
        let line4: [Cell] = [cellElephantP2,cellJungle,cellCatP2, cellJungle, cellRatP2]
        let line5: [Cell] = [cellJungle,cellTigerP2,cellDen2, cellLionP2, cellJungle]
        
        let grid : [[Cell]] = [line1, line2, line3, line4, line5]
        let invalidBoard : Board = Board(withGrid: grid)!
        XCTAssertThrowsError(try VerySimpleRules.checkBoard(b: invalidBoard)) { error in
            XCTAssertTrue(error is InvalidBoardError)
            XCTAssertEqual(error as? InvalidBoardError, InvalidBoardError.badCellType(.water, 1, 1))
        }
    }
    
    func testPieceWithNoOwner() {
        let invalidCell = Cell(ofType: .water, ownedBy: .player2)
        
        
        let cellJungle: Cell = Cell(ofType: .jungle)
        let cellDen1: Cell = Cell(ofType: .den, ownedBy: .player1)
        let cellDen2 = Cell(ofType: .den, ownedBy: .player2)
        
        let invalidPiece = Piece(withOwner: .noOne, andAnimal: .lion)
        let catP1 = Piece(withOwner: .player1, andAnimal: .cat)
        let ratP1 = Piece(withOwner: .player1, andAnimal: .rat)
        let tigerP1 = Piece(withOwner: .player1, andAnimal: .tiger)
        let elephantP1 = Piece(withOwner: .player1, andAnimal: .elephant)
        
        let lionP2 = Piece(withOwner: .player2, andAnimal: .lion)
        let catP2 = Piece(withOwner: .player2, andAnimal: .cat)
        let ratP2 = Piece(withOwner: .player2, andAnimal: .rat)
        let tigerP2 = Piece(withOwner: .player2, andAnimal: .tiger)
        let elephantP2 = Piece(withOwner: .player2, andAnimal: .elephant)
        
        //Creation des Cells pour le player 1
        let cellLionP1 = Cell(ofType: .jungle,ownedBy: .player1, withPiece: invalidPiece)
        let cellTigerP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: tigerP1)
        let cellCatP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: catP1)
        let cellRatP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: ratP1)
        let cellElephantP1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: elephantP1)

        //Creation des Cells pour le player 2
        let cellLionP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: lionP2)
        let cellTigerP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: tigerP2)
        let cellCatP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: catP2)
        let cellRatP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: ratP2)
        let cellElephantP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: elephantP2)
        
        let line1: [Cell] = [cellJungle,cellLionP1,cellDen1, cellTigerP1, cellJungle]
        let line2: [Cell] = [cellRatP1,invalidCell,cellCatP1, cellJungle, cellElephantP1]
        let line3: [Cell] = [cellJungle,cellJungle,cellJungle, cellJungle, cellJungle]
        let line4: [Cell] = [cellElephantP2,cellJungle,cellCatP2, cellJungle, cellRatP2]
        let line5: [Cell] = [cellJungle,cellTigerP2,cellDen2, cellLionP2, cellJungle]
        
        let grid : [[Cell]] = [line1, line2, line3, line4, line5]
        let invalidBoard : Board = Board(withGrid: grid)!
        XCTAssertThrowsError(try VerySimpleRules.checkBoard(b: invalidBoard)) { error in
            XCTAssertTrue(error is InvalidBoardError)
            XCTAssertEqual(error as? InvalidBoardError, InvalidBoardError.pieceWithNoOwner(invalidPiece))
        }
    }
    
    func testGetNextPlayer(){
        rule.historic.append(Move(owner: .player1, rowOrigin: 1, colomnOrigin: 2, rowDestination: 2, columnDestination: 2))
        let nextOwner = rule.getNextPlayer()
        XCTAssertEqual(nextOwner, .player2)
        
        rule.historic.append(Move(owner: .player2, rowOrigin: 1, colomnOrigin: 2, rowDestination: 2, columnDestination: 2))
        let nextOwner2 = rule.getNextPlayer()
        XCTAssertEqual(nextOwner2, .player1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
