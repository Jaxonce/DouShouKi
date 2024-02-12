//
//  GameError.swift
//
//
//  Created by Maxence Lanone on 22/01/2024.
//

import Foundation

public enum GameError : Error{
    case invalidMore, nextPlayerError, badPlayerId(id: String)
}
