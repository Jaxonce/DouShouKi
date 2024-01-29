//
//  Move.swift
//
//
//  Created by Maxence Lanone on 22/01/2024.
//

import Foundation

public struct Move: Equatable {
    public var owner: Owner
    public var rowOrigin: Int
    public var colomnOrigin: Int
    public var rowDestination: Int
    public var columnDestination: Int
    
    public init(owner: Owner, rowOrigin: Int, colomnOrigin: Int, rowDestination: Int, columnDestination: Int) {
        self.owner = owner
        self.rowOrigin = rowOrigin
        self.colomnOrigin = colomnOrigin
        self.rowDestination = rowDestination
        self.columnDestination = columnDestination
    }
    
    public var description : String {
        return "\(owner) with origin (\(rowOrigin),\(colomnOrigin)) and destination (\(rowDestination),\(columnDestination))"
    }
    
    ///Faire description move
}
