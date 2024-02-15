//
//  File.swift
//  
//
//  Created by Maxence Lanone on 15/02/2024.
//

import Foundation
import Model

extension Move : Codable {
    private enum CodingKeys: String, CodingKey{
        case owner
        case rowOrigin
        case colomnOrigin
        case rowDestination
        case columnDestination
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.owner, forKey: .owner)
        try container.encode(self.rowOrigin, forKey: .rowOrigin)
        try container.encode(self.colomnOrigin, forKey: .colomnOrigin)
        try container.encode(self.rowDestination, forKey: .rowDestination)
        try container.encode(self.columnDestination, forKey: .columnDestination)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let ownerDecode = try container.decode(Owner.self, forKey: .owner)
        let rowOriginDecode = try container.decode(Int.self, forKey: .rowOrigin)
        let colomnOriginDecode = try container.decode(Int.self, forKey: .colomnOrigin)
        let rowDestDecode = try container.decode(Int.self, forKey: .rowDestination)
        let colDestDecode = try container.decode(Int.self, forKey: .columnDestination)
        self.init(owner: ownerDecode, rowOrigin: rowOriginDecode, colomnOrigin: colomnOriginDecode, rowDestination: rowDestDecode, columnDestination: colDestDecode)
    }
    
    
}
