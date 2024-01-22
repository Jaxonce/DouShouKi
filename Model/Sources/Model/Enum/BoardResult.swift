//
//  BoardResult.swift
//
//
//  Created by Maxence Lanone on 16/01/2024.
//

import Foundation

public enum BoardResult: Equatable {
    case ok, failed(reason : BoardFailingReason), unknown
}
