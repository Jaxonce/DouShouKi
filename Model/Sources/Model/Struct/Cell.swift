//
//  Cell.swift
//
//
//  Created by Maxence Lanone on 11/01/2024.
//

import Foundation

public struct Cell: CustomStringConvertible, Equatable, Hashable {
    public let cellType: CellType
    public var piece: Piece?
    public let initialOwner: Owner
    
    /// Cell's Ctor
    /// - Parameters:
    ///   - cellType: type of Cell
    ///   - initialOwner: the owner of the cell
    ///   - piece: the piece of the Cell
    public init(ofType cellType: CellType = .unknown, ownedBy initialOwner: Owner = .noOne, withPiece piece: Piece? = nil) {
        self.cellType = cellType
        self.initialOwner = initialOwner
        self.piece = piece
    }
    
    public var description: String{
        let pieceValue = piece?.description ?? "ø"
        return "\(pieceValue) on \(cellType), \(initialOwner.description)"
    }
}
