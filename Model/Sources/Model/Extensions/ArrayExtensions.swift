//
//  File.swift
//  
//
//  Created by Maxence Lanone on 17/01/2024.
//

import Foundation
import Model

extension Array where Element == [Cell] {
    func count(owner: Owner) -> Int{
        var nbPiece: Int = 0
        for row in self{
            for cell in row {
                if cell.piece?.owner == owner{
                    nbPiece += 1
                }
            }
        }
        return nbPiece
    }
}
