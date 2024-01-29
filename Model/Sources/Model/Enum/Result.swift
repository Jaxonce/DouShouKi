//
//  Result.swift
//
//
//  Created by Maxence Lanone on 22/01/2024.
//

import Foundation

public enum Result :Equatable{
    case notFinished, even, winner(_ : Owner, _ : WinningReason)
}
