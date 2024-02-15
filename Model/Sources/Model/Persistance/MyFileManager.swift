//
//  File.swift
//  
//
//  Created by Maxence Lanone on 12/02/2024.
//

import Foundation

public struct MyFileManager {
    
    /// Save a generic object in json
    /// - Parameters:
    ///   - object: object to save
    ///   - fileName: name of the destination file
    public static func save<T: Encodable>(object: T, to fileName: String) {
            let fileManager = FileManager.default
            do {
                let currentFilePath = #file
                let currentDirectoryPath = URL(fileURLWithPath: currentFilePath).deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent().path
                let filePath = URL(fileURLWithPath: "\(currentDirectoryPath)/JSON/\(fileName)")
                if !fileManager.fileExists(atPath: "\(currentDirectoryPath)/JSON") {
                        do {
                            try fileManager.createDirectory(atPath: "\(currentDirectoryPath)/JSON", withIntermediateDirectories: true, attributes: nil)
                        } catch {
                            return
                        }
                    }
                let encoder = JSONEncoder()
                let jsonData = try encoder.encode(object)
                try jsonData.write(to: filePath)
            } catch {
                print("Error saving file: \(error.localizedDescription)")
            }
        }
    
    /// Load a generic json object and transform in T Object
    /// - Parameters:
    ///   - fileName: name of the file where is the json
    ///   - type: type in which we want transform the json object
    /// - Returns: return the object 
        public static func load<T: Decodable>(from fileName: String, as type: T.Type) -> T? {
            let fileManager = FileManager.default
            let currentFilePath = #file
            let currentDirectoryPath = URL(fileURLWithPath: currentFilePath).deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent().path
            let filePath = "\(currentDirectoryPath)/JSON/\(fileName)"
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
                let decoder = JSONDecoder()
                do {
                    let object = try decoder.decode(type, from: jsonData)
                    return object
                } catch {
                    return nil
                }
            } else {
                return nil
            }
        }
}
