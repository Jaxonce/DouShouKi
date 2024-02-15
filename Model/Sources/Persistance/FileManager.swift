//
//  File.swift
//  
//
//  Created by Maxence Lanone on 12/02/2024.
//

import Foundation

public struct FileManager {
    
    static func getSaveDirectoryUrl(withName name: String) throws -> URL {
        
        // On se place dans le dossier de l'utilisateur
        let baseUrl = try URL(for: .documentDirectory, in: .userDomainMask).appending(path: "CurrentGame")
        
        // Si le dossier n'existe pas, on le crée
        if !FileManager.default.fileExists(atPath: baseUrl.absoluteString) {
            // On crée le dossier
            try FileManager.default.createDirectory(at: baseUrl, withIntermediateDirectories: true)
        }
        
        // Si il reussi il rend le dossier sinon il rend une erreur
        return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appending(path: "CurrentGame")
        
    }
    
    public static func saveGame(withName name: String, andGame game: Game) async throws {
            // On crée une tache asynchrone
            let task = Task {
                do {
                    // On encode le nounours en json
                    let data = try JSONEncoder().encode(game)
                    // On récupère le dossier de sauvegarde
                    let outfile = try Self.getSaveDirectoryUrl().appending(path: name)
                    // On écrit le fichier
                    try data.write(to: outfile)
                }
                catch {
                    throw error
                }
            }
        }


        public static func loadGame(withName name: String) async throws -> Game? {
            let task = Task<Game?, Error> {
                let fileUrl = try Self.getSaveDirectoryUrl().appending(path: name)
                guard let data = try? Data(contentsOf: fileUrl) else {
                    return nil
                    // Ou lance une erreur
                }
                let game = try JSONDecoder().decode(Game.self, from: data)
                return game
            }
            return try await task.value
        }
