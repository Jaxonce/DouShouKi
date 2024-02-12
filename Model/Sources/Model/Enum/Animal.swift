//
//  File.swift
//  
//
//  Created by Maxence Lanone on 11/01/2024.
//

import Foundation

public enum Animal: String, Comparable, CaseIterable, Codable{
    public static func < (lhs: Animal, rhs: Animal) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    case rat = "1", cat = "2", dog = "3", wolf = "4" , leopard = "5", tiger = "6", lion = "7", elephant = "8"
}
