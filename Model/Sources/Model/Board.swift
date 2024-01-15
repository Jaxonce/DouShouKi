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
        guard grid.isEmpty else{
            return nil
        }
        let nbCellule = grid.first?.count
        if !grid.allSatisfy({nbCellule == $0.count}) {
            return nil
        }
        self.grid = grid
        self.nbRow = grid.count
        self.nbColumn = nbCellule!
        
    }
    
    
    
}
