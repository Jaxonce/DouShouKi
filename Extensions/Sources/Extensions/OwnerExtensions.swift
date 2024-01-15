//
//  OwnerExtensions.swift
//  
//
//  Created by Maxence Lanone on 15/01/2024.
//

import Foundation
import Model

extension Owner{
    var description: String{
        switch self {
        case .noOne:
            return " "
        case .player1:
            return "🟡"
        case .player2:
            return "🔴"
        }
    }
}
