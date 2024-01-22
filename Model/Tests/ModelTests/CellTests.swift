//
//  CellTests.swift
//  
//
//  Created by Maxence Lanone on 17/01/2024.
//

import XCTest
import Model

final class CellTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
    }

    func testDescription() throws {
        let cellType : CellType = .jungle
        let owner : Owner = .player1
        let piece : Piece = Piece(withOwner: owner, andAnimal: .cat)

        let cell = Cell(ofType: cellType, ownedBy: owner, withPiece: piece)

        // Act
        let result = cell.description

        // Assert
        let expectedDescription = "\(piece.description) on \(cellType), \(owner)"
        XCTAssertEqual(result, expectedDescription, "Description should match expected format")
    }

}
