//
//  InvalidBoardError.swift
//
//
//  Created by Maxence Lanone on 22/01/2024.
//

import Foundation

public enum InvalidBoardError: Error, Equatable{
    case badDimensions(Int,Int),badCellType(CellType, Int, Int),multipleOccurencesOfSamePiece(Piece), pieceWithNoOwner(Piece), pieceNotAllowedOnThisCell(Piece, Cell)
}
