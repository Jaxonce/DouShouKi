//
//  Cell.swift
//
//
//  Created by Maxence Lanone on 11/01/2024.
//

import Foundation

public struct Cell: CustomStringConvertible {
    public let cellType: CellType
    public let piece: Piece?
    public let initialOwner: Owner
    
    init(ofType cellType: CellType = .unknown, ownedBy initialOwner: Owner = .noOne, withPiece piece: Piece? = nil) {
        self.cellType = cellType
        self.initialOwner = initialOwner
        self.piece = piece
    }
    
    public var description: String{
        let pieceValue = piece?.description ?? "ø"
        return "\(pieceValue) on \(cellType), \(initialOwner.description)"
    }
    
    public func test(){
        var board: Board
        board.grid[0][0].piece = []
    }
}
