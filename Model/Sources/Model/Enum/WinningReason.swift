//
//  WinningReason.swift
//
//
//  Created by Maxence Lanone on 22/01/2024.
//

import Foundation

public enum WinningReason {
    case unknown, denReached, noMorePieces, tooManyOccurences, noMovesLeft
    
    public var description :String{
        switch self {
        case .unknown:
            return "unknown."
        case .denReached:
            return "the opponent's den has been reached."
        case .noMorePieces:
            return "the player has no more pieces."
        case .tooManyOccurences:
            return "there are too many occorences."
        case .noMovesLeft:
            return "the player has no moves left."
        }
    }
}
