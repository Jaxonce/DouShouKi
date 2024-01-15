//
//  Piece.swift
//
//
//  Created by Maxence Lanone on 11/01/2024.
//

import Foundation

public struct Piece : CustomStringConvertible{
    public let owner: Owner
    public let animal: Animal
    
    init(withOwner owner: Owner, andAnimal animal: Animal) {
        self.owner = owner
        self.animal = animal
    }
    
    public var description : String {
        return "[\(owner.description):\(animal.rawValue)]"
    }
}
