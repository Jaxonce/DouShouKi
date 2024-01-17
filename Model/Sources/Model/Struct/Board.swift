//
//  Board.swift
//
//
//  Created by Maxence Lanone on 11/01/2024.
//

import Foundation

public struct Board : Equatable{
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
    
    /// Count pieces for a player
    /// - Parameter owner: player we want to know their piece number
    /// - Returns: owner's number of piece
    public func countPieces(of owner: Owner) -> Int{
        return grid.count(owner)
    }
    
    /// Count pieces for all players
    /// - Returns: a tuple with the number of piece for each player
    public func countPieces() -> (player1: Int, player2: Int) {
        return (grid.count(.player1),grid.count(.player2))
    }
    
    /// Demander au prof si on doit aussi mettre owner dans Cell en var pour le modif et le mettre a noOne quand on appelle removePiece, sachant que l'attribut s'appelle initialOwner
    /// - Parameters:
    ///   - piece: piece to add
    ///   - row: the row where we want to add
    ///   - column: the column where we want to add
    /// - Returns: ok if all is good, failed with detail if there is an error
    public mutating func insert(_ piece: Piece, atRow row: Int, andColumn column: Int) -> BoardResult{
        guard !((row >= 0 && row >= nbRow) || (column >= 0 && column >= nbColumn)) else{
            return .failed(reason: .outOfBounds)
        }
        guard self.grid[row][column].piece == nil else{
            return .failed(reason: .cellNotEmpty)
        }
        self.grid[row][column].piece = piece
        return .ok
    }
    
    /// Remove a piece
    /// - Parameters:
    ///   - row: the row where we want to remove the piece
    ///   - column: the column where we want to remove the piece
    /// - Returns: ok if all is good, failed with detail if there is an error
    public mutating func removePiece(atRow row: Int, andColumn column: Int) -> BoardResult {
        ///Pas sur de ca, a verif car ca me parait mal coder
        ///Que faire si il y a plusieurs erreur en même temps
        ///Test out of ne marche pas avec value negative je sais pas pk
        guard !((row >= 0 && row >= nbRow) || (column >= 0 && column >= nbColumn)) else{
            return .failed(reason: .outOfBounds)
        }
        guard self.grid[row][column].piece != nil else{
            return .failed(reason: .cellEmpty)
        }
        self.grid[row][column].piece = nil
        return .ok
    }
}
