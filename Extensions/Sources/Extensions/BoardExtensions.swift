//
//  BoardExtensions.swift
//
//
//  Created by Maxence Lanone on 15/01/2024.
//

import Foundation
import Model

extension Board: CustomStringConvertible{
    public var description: String{
        var result = ""
        for row in grid {
            for cell in row {
                result.append(cell.cellType.description)
                if let animal = cell.piece?.description{
                    result.append(animal.description)
                }
                else {
                    result.append(" ")
                }
                if let owner = cell.piece?.owner{
                    result.append(owner.description)
                }
                else {
                    result.append(" ")
                }
                result.append("\t")
                
            }
            result.append("\n")
        }
        return result
    }
}
