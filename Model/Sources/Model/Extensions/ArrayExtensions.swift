//
//  File.swift
//  
//
//  Created by Maxence Lanone on 17/01/2024.
//

import Foundation

extension Array where Element == Array<Cell> {
    func count(_ owner: Owner) -> Int{
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
