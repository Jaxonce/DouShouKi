//
//  HumanPlayerTests.swift
//  
//
//  Created by Maxence Lanone on 05/02/2024.
//

import XCTest
import Model

final class HumanPlayerTests: XCTestCase {
    
    var board: Board = VerySimpleRules.createBoard()
    var rule : Rules = VerySimpleRules()

    override func setUpWithError() throws {
        
    }
    
    func inputForHumanPlayer(player: HumanPlayer) -> Move? {
        return Move(owner: player.id, rowOrigin: 0, colomnOrigin: 1, rowDestination: 0, columnDestination: 2)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateHumanPlayer() throws {
        let expectedName = "Jax"
        let expectedId : Owner = .player1
        
        let player : Player? = HumanPlayer(withName: "Jax", andId: .player1, andInputMethod: inputForHumanPlayer)
        
        XCTAssertNotNil(player)
        XCTAssertEqual(expectedName, player?.name)
        XCTAssertEqual(expectedId, player?.id)
    }
    
    func testChooseMove_OK() throws {
        let player : Player? = HumanPlayer(withName: "Jax", andId: .player1, andInputMethod: inputForHumanPlayer)
        
        let expectedResult = Move(owner: player!.id, rowOrigin: 0, colomnOrigin: 1, rowDestination: 0, columnDestination: 2)
        
        let result = player?.chooseMove(in: board, with: rule)
        
        XCTAssertEqual(expectedResult, result)
    }
    
    func testChooseMove_Nil() throws {
        let player : Player? = HumanPlayer(withName: "Jax", andId: .player1, andInputMethod: { _ in nil })
        
        XCTAssertNil(player?.chooseMove(in: board, with: rule))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
