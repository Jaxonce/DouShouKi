//
//  File.swift
//  
//
//  Created by Maxence Lanone on 15/02/2024.
//

import Foundation
import Model

extension Cell : Codable{
    private enum CodingKeys: String, CodingKey{
        case cellType
        case piece
        case initialOwner
    }
    
    /// Enable to transform a Cell in Json
    /// - Parameter encoder: the encode use to encode the Cell
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cellType.self, forKey: .cellType)
        try container.encode(piece.self, forKey: .piece)
        try container.encode(initialOwner.self, forKey: .initialOwner)
    }
    
    /// Init to transform a Json Cell in Cell Object
    /// - Parameter decoder: decoder use to decode the Cell
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let cellTypeDecode = try container.decode(CellType.self, forKey: .cellType)
        let pieceDecode = try container.decode(Piece?.self, forKey: .piece)
        let ownerDecode = try container.decode(Owner.self, forKey: .initialOwner)
        self.init(ofType: cellTypeDecode, ownedBy: ownerDecode, withPiece: pieceDecode)
    }
    
    
}
