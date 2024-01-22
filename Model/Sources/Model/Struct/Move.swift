//
//  Move.swift
//
//
//  Created by Maxence Lanone on 22/01/2024.
//

import Foundation

public struct Move {
    public var owner: Owner
    public var rowOrigin: Int
    public var colomnOrigin: Int
    public var rowDestination: Int
    public var columnDestination: Int
    
    init(owner: Owner, rowOrigin: Int, colomnOrigin: Int, rowDestination: Int, columnDestination: Int) {
        self.owner = owner
        self.rowOrigin = rowOrigin
        self.colomnOrigin = colomnOrigin
        self.rowDestination = rowDestination
        self.columnDestination = columnDestination
    }
}
