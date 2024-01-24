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
    var grid = [[Cell]]()

    override func setUpWithError() throws {
        board = VerySimpleRules.createBoard()
        let cellJungle: Cell = Cell(ofType: .jungle)
        
        let cellDen2: Cell = Cell(ofType: .den, ownedBy: .player2)
        let cellDen1: Cell = Cell(ofType: .den, ownedBy: .player1)
        
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
        let line5: [Cell] = [cellJungle,cellTigerP2,cellDen2, cellLionP2, cellJungle]
        
        grid = [line1, line2, line3, line4, line5]
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
        let invalidCell = Cell(ofType: .trap, ownedBy: .player1)
        var invalidGrid = grid
        invalidGrid[0][2] = invalidCell
        let invalidBoard : Board = Board(withGrid: invalidGrid)!
        XCTAssertThrowsError(try VerySimpleRules.checkBoard(b: invalidBoard)) { error in
            XCTAssertTrue(error is InvalidBoardError)
            XCTAssertEqual(error as? InvalidBoardError, InvalidBoardError.badCellType(invalidCell.cellType, 0, 2))
        }
    }
    
    func testInvalidCellTypeLastRow() {
        let invalidCell = Cell(ofType: .trap, ownedBy: .player2)
        var invalidGrid = grid
        invalidGrid[4][2] = invalidCell
        let invalidBoard : Board = Board(withGrid: invalidGrid)!
        XCTAssertThrowsError(try VerySimpleRules.checkBoard(b: invalidBoard)) { error in
            XCTAssertTrue(error is InvalidBoardError)
            XCTAssertEqual(error as? InvalidBoardError, InvalidBoardError.badCellType(invalidCell.cellType, invalidBoard.nbRow, 2))
        }
    }
    
    func testMultipleOccurrencesOfSamePiece() {
        let lionP1 = Piece(withOwner: .player1, andAnimal: .lion)
        let invalidCell = Cell(ofType: .jungle,ownedBy: .player1, withPiece: lionP1)
        var invalidGrid = grid
        invalidGrid[0][3] = invalidCell
        let invalidBoard : Board = Board(withGrid: invalidGrid)!
        XCTAssertThrowsError(try VerySimpleRules.checkBoard(b: invalidBoard)) { error in
            XCTAssertTrue(error is InvalidBoardError)
            XCTAssertEqual(error as? InvalidBoardError, InvalidBoardError.multipleOccurencesOfSamePiece(invalidCell.piece!))
        }
    }
    
    func testInvalidCellTypeInBoard() {
        let invalidCell = Cell(ofType: .water, ownedBy: .player2)
        var invalidGrid = grid
        invalidGrid[1][1] = invalidCell
        let invalidBoard : Board = Board(withGrid: invalidGrid)!
        XCTAssertThrowsError(try VerySimpleRules.checkBoard(b: invalidBoard)) { error in
            XCTAssertTrue(error is InvalidBoardError)
            XCTAssertEqual(error as? InvalidBoardError, InvalidBoardError.badCellType(.water, 1, 1))
        }
    }
    
    func testPieceWithNoOwner() {
        let invalidPiece = Piece(withOwner: .noOne, andAnimal: .lion)
        let invalidCell = Cell(ofType: .jungle,ownedBy: .player1, withPiece: invalidPiece)
        var invalidGrid = grid
        invalidGrid[0][1] = invalidCell
        let invalidBoard : Board = Board(withGrid: invalidGrid)!
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
