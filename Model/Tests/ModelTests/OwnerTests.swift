//
//  OwnerTests.swift
//  
//
//  Created by Maxence Lanone on 17/01/2024.
//

import XCTest
import Model

final class OwnerTests: XCTestCase {

    func testExample() throws {
        let owner: Owner = .noOne
        let owner2: Owner = .player1
        let owner3: Owner = .player2
        
        let result = owner.description
        let result2 = owner2.description
        let result3 = owner3.description
        // Assert
        let expectedDescription = "x"
        let expectedDescription2 = "1"
        let expectedDescription3 = "2"
        
        XCTAssertEqual(result, expectedDescription, "Description should match expected format")
        XCTAssertEqual(result2, expectedDescription2, "Description should match expected format")
        XCTAssertEqual(result3, expectedDescription3, "Description should match expected format")
    }

}
