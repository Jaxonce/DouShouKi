//
//  File.swift
//  
//
//  Created by Maxence Lanone on 15/02/2024.
//

import Foundation
import Model

extension Piece: Codable {
    private enum CodingKeys: String, CodingKey{
        case animal
        case owner
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(owner, forKey: .owner)
        try container.encode(animal, forKey: .animal)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let ownerDecode = try container.decode(Owner.self, forKey: .owner)
        let animalDecode = try container.decode(Animal.self, forKey: .animal)
        self.init(withOwner: ownerDecode, andAnimal: animalDecode)
    }
}
