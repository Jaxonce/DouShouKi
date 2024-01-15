//
//  BoardExtensions.swift
//
//
//  Created by Maxence Lanone on 15/01/2024.
//

import Foundation
import Model

extension Board{
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
