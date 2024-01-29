//
//  Owner.swift
//
//
//  Created by Maxence Lanone on 11/01/2024.
//

import Foundation

public enum Owner: CustomStringConvertible, Hashable{
    case noOne, player1, player2
    
    public var description :String{
        switch self {
        case .noOne:
            return "x"
        case .player1:
            return "1"
        case .player2:
            return "2"
        }
    }
}
