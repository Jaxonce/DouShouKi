//
//  RandomPlayerTests.swift
//  
//
//  Created by Maxence Lanone on 05/02/2024.
//

import XCTest
import Model

final class RandomPlayerTests: XCTestCase {

    var board: Board = VerySimpleRules.createBoard()
    var rule : Rules = VerySimpleRules()
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateRandomPlayer() throws {
        let expectedName = "Jax"
        let expectedId : Owner = .player1
        
        let player : Player? = RandomPlayer(withName: "Jax", andId: .player1)
        
        XCTAssertNotNil(player)
        XCTAssertEqual(expectedName, player?.name)
        XCTAssertEqual(expectedId, player?.id)
    }
    
    func testChooseMove() throws {
        let player : Player? = RandomPlayer(withName: "Jax", andId: .player1)
        
        let result = player?.chooseMove(in: board, with: rule)
        let result2 = player?.chooseMove(in: board, with: rule)
        
        XCTAssertNotNil(result)
        XCTAssertNotEqual(result, result2)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
