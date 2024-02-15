//
//  BoardExtensions.swift
//
//
//  Created by Maxence Lanone on 15/01/2024.
//

import Foundation
import Model

extension Board : Codable{
    private enum CodingKeys: String, CodingKey{
        case grid
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(grid.self, forKey: .grid)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let gridDecode = try container.decode([[Cell]].self, forKey: .grid)
        self.init(withGrid: gridDecode)!
    }
    
    public var display: String{
        var result = ""
        for row in grid {
            for cell in row {
                result.append(cell.cellType.symbol)
                if let animal = cell.piece?.animal{
                    result.append(animal.symbol)
                }
                else {
                    result.append(" ")
                }
                if let owner = cell.piece?.owner{
                    result.append(owner.symbol)
                }
                else {
                    result.append(" ")
                }
                result.append("\t\t")
                
            }
            result.append("\n\n")
        }
        return result
    }
}
