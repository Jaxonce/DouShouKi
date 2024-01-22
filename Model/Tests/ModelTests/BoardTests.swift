import XCTest
@testable import Model

final class BoardTests: XCTestCase {
    func testCreateEmptyBoard() throws{
        let board = Board(withGrid: [])
        
        XCTAssertEqual(board, nil)
    }
    
    func testCreateWithoutSameLine(){
        let lionP2 = Piece(withOwner: .player2, andAnimal: .lion)
        let dogP2 = Piece(withOwner: .player2, andAnimal: .dog)
        let catP2 = Piece(withOwner: .player2, andAnimal: .cat)
        
        let cellLionP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: lionP2)
        let cellTigerP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: catP2)
        let cellDogP2 = Cell(ofType: .jungle, ownedBy: .player2, withPiece: dogP2)
        
        let line1: [Cell] = [cellDogP2, cellLionP2]
        let line2: [Cell] = [cellTigerP2]
        
        let grid : [[Cell]] = [line1, line2]
        
        let board = Board(withGrid: grid)
        
        XCTAssertEqual(board, nil)
    }
    
    func testInsert_Ok() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        
        let expectedResult : BoardResult = .ok
        
        let pieceToAdd = Piece(withOwner: .player2, andAnimal: .lion)
        var board = Board(withGrid: [[Cell(ofType: .jungle)]])!
        
        let result = board.insert(pieceToAdd, atRow: 0, andColumn: 0)
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func testInsert_NotEmpty() throws {
        let expectedResult : BoardResult = .failed(reason: .cellNotEmpty)
        
        let pieceToAdd = Piece(withOwner: .player2, andAnimal: .lion)
        var board = Board(withGrid: [[Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .rat))]])!
        
        let result = board.insert(pieceToAdd, atRow: 0, andColumn: 0)
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func testRemove_Ok() throws {
        let expectedResult : BoardResult = .ok
        
        var board = Board(withGrid: [[Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .rat))]])!
        
        let result = board.removePiece(atRow: 0, andColumn: 0)
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func testRemove_Empty() throws {
        let expectedResult : BoardResult = .failed(reason: .cellEmpty)
        
        var board = Board(withGrid: [[Cell(ofType: .jungle, ownedBy: .player1)]])!
        
        let result = board.removePiece(atRow: 0, andColumn: 0)
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func testRemove_OutOf() throws {
        let expectedResult : BoardResult = .failed(reason: .outOfBounds)
        
        var board = Board(withGrid: [[Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .rat))]])!
        
        let result = board.removePiece(atRow: 1, andColumn: 1)
//        let result2 = board.removePiece(atRow: -1, andColumn: -1)
        
        XCTAssertEqual(result, expectedResult)
//        XCTAssertEqual(result2, expectedResult)
    }
    
    func testInsert_OutOf() throws {
        let expectedResult : BoardResult = .failed(reason: .outOfBounds)
        
        let pieceToAdd = Piece(withOwner: .player2, andAnimal: .lion)
        var board = Board(withGrid: [[Cell(ofType: .jungle, ownedBy: .player1)]])!
        
        let result = board.insert(pieceToAdd, atRow: 1, andColumn: 1)
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func testCountPiece_Player() throws {
        let board = Board(withGrid: [[Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .rat))]])!
        
        XCTAssertEqual(board.countPieces(of: .player1), 1)
        XCTAssertEqual(board.countPieces(of: .player2), 0)
    }
    
    func testCountPiece_All() throws {
        let board = Board(withGrid: [[Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .rat))]])!
        let result = board.countPieces()
        XCTAssertEqual(result.0, 1)
        XCTAssertEqual(result.1, 0)
    }
    
}
