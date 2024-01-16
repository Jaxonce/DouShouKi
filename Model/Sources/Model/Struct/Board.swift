//
//  Board.swift
//
//
//  Created by Maxence Lanone on 11/01/2024.
//

import Foundation

public struct Board {
    public let nbRow: Int
    public let nbColumn: Int
    public private(set) var grid: [[Cell]]
    
    /// Ctor Board
    /// - Parameter grid: grid represent different Cells
    public init?(withGrid grid: [[Cell]]) {
        guard !grid.isEmpty else{
            return nil
        }
        let nbCellule = grid.first?.count
        guard grid.allSatisfy({nbCellule == $0.count}) else{
            return nil
        }
        self.grid = grid
        self.nbRow = grid.count
        self.nbColumn = nbCellule!
        
    }
    
    public func pieceCount(forOwner owner: Owner) -> Int{
        var nbPiece = 0
        for row in grid {
            for cell in row {
                if cell.piece?.owner == owner{
                    nbPiece += 1
                }
            }
        }
        return nbPiece;
    }
    
    public func pieceCount() -> (Int,Int) {
        return (pieceCount(forOwner: .player1),pieceCount(forOwner: .player2))
    }
}
