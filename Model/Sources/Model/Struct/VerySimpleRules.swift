//
//  VerySimpleRules.swift
//
//
//  Created by Maxence Lanone on 22/01/2024.
//

import Foundation

public struct VerySimpleRules: Rules {
    public var occurences: [Board : Int]
    public var historic: [Move]
    
    public init() {
        self.occurences = [Board : Int]()
        self.historic = [Move]()
    }
    
    public func getMoves(board: Board, owner: Owner) -> [Move] {
        let moves = [Move]()
        return moves
    }
    
    
    /// Permet de récuperer les coups possible pour une row et une column donné
    /// - Parameters:
    ///   - board: la board actuelle
    ///   - owner: le player qui veut bouger
    ///   - row: la row acuelle
    ///   - column: la colonne actuelle
    /// - Returns: renvoi un tableau avec les move possible
    public func getMoves(board: Board, owner: Owner, withRaw row: Int, andColumn column: Int) -> [Move] {
        var moves = [Move]()
        if isMoveValid(board: board, initialRow: row, initialColumn: column, destinationRow: row, destinationColumn: column+1){
            moves.append(Move(owner: owner, rowOrigin: row, colomnOrigin: column, rowDestination: row, columnDestination: column+1))
        }
        if isMoveValid(board: board, initialRow: row, initialColumn: column, destinationRow: row+1, destinationColumn: column){
            moves.append(Move(owner: owner, rowOrigin: row, colomnOrigin: column, rowDestination: row+1, columnDestination: column))
        }
        if isMoveValid(board: board, initialRow: row, initialColumn: column, destinationRow: row-1, destinationColumn: column){
            moves.append(Move(owner: owner, rowOrigin: row, colomnOrigin: column, rowDestination: row-1, columnDestination: column))
        }
        if isMoveValid(board: board, initialRow: row, initialColumn: column, destinationRow: row, destinationColumn: column-1){
            moves.append(Move(owner: owner, rowOrigin: row, colomnOrigin: column, rowDestination: row, columnDestination: column-1))
        }
        return moves
    }
    
    ///  indique si un coup est autorisé d'une cellule vers une autre
    /// - Parameters:
    ///   - board: board actuelle
    ///   - initialRow: ligne initiale ou se trouve la piece à déplacer
    ///   - initialColumn: colonne initiale ou se trouve la piece à déplacer
    ///   - destinationRow: ligne ou veut se déplacer la piece
    ///   - destinationColumn: colonne ou veut se déplacer la piece
    /// - Returns: true si le move est valide, false si le coup n'est pas valide
    public func isMoveValid(board: Board, initialRow: Int, initialColumn: Int, destinationRow: Int, destinationColumn: Int) -> Bool {
        let destinationCell = board.grid[destinationRow][destinationColumn]
        let initialCell = board.grid[initialRow][initialColumn]
        if board.grid[initialRow][initialColumn] == board.grid[destinationRow][destinationColumn] {
            return false
        }
        if destinationCell.piece?.owner == initialCell.piece?.owner {
            return false
        }
        if abs(initialRow - destinationRow) != 1 || abs(initialRow - destinationRow) != 1 {
            return false
        }
        if destinationCell.piece == nil {
            return true
        }
        ///A verif il y a peut etre d'autre verif a faire
        ///!(column-1 < 0)
        return true
    }
    
    /// Meme fonction que celle du dessus, mais au lieu de passer directement les coordonnées, on passe un move
    /// - Parameters:
    ///   - board: board acutelle
    ///   - move: représente le coup que le joueur veut faire
    /// - Returns: true si le move est valide, false si il ne l'est pas
    public func isMoveValid(board: Board, canMove move: Move) -> Bool {
        return isMoveValid(board: board, initialRow: move.rowOrigin, initialColumn: move.colomnOrigin, destinationRow: move.rowDestination, destinationColumn: move.columnDestination)
    }
    
    /// Permet de verifier si un des joueurs a perdu
    /// - Parameters:
    ///   - board: board actuelle
    ///   - row: ligne qui représente le positionnement du dernier move qui vient d'etre effectuer
    ///   - column: ligne qui représente le positionnement du dernier move qui vient d'etre effectuer
    /// - Returns: retourne un tuple avec true ou false, si la partie est gagné ou non, et un resultat avec une valeur associé lorsque la partie est gagné (permet de détaillé la raison de la victoire)
    public func isGameOver(board: Board, withLastRow row: Int, andLastColumn column: Int) -> (Bool, Result) {
        let lastCell = board.grid[row][column]
        let nextPlayer = getNextPlayer()
        if lastCell.cellType == .den {
            if let piece = lastCell.piece, piece.owner != lastCell.initialOwner {
                return (true, .winner(piece.owner, .denReached))
            }
            else{
                return (false, .notFinished)
            }
        }
        ///Verif nombre de piece joueur1
        guard board.countPieces(of: .player1) != 0 else{
            return (true, .winner(.player2, .noMovesLeft))
        }
        ///Verif nombre de piece joueur2
        guard board.countPieces(of: .player2) != 0 else{
            return (true, .winner(.player1, .noMovesLeft))
        }
        ///Test pour verifier que le nombre d'occurence pour la board actuelle n'est pas a 3
            ///verification du nombre d'occurence
        if let occ = occurences[board], occ >= 3 {
            return (true, .winner(nextPlayer, .tooManyOccurences))
        } else {
                return (false, .notFinished)
        }
    }
    
    public mutating func playedMove(move: Move, boardBefore: Board, boardAfter: Board) {
        historic.append(move)
    }

    public static func createBoard() -> Board {
        
        var grid : [[Cell]] = 
        [
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle,ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .lion)),
                Cell(ofType: .den, ownedBy: .player1),
                Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .tiger)),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .rat)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .cat)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, ownedBy: .player1, withPiece: Piece(withOwner: .player1, andAnimal: .elephant))
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle)
            ],
            [
                Cell(ofType: .jungle, ownedBy: .player2, withPiece: Piece(withOwner: .player2, andAnimal: .elephant)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, ownedBy: .player2, withPiece: Piece(withOwner: .player2, andAnimal: .cat)),
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, ownedBy: .player2, withPiece: Piece(withOwner: .player2, andAnimal: .rat))
            ],
            [
                Cell(ofType: .jungle),
                Cell(ofType: .jungle, ownedBy: .player2, withPiece: Piece(withOwner: .player2, andAnimal: .tiger)),
                Cell(ofType: .den, ownedBy: .player2),
                Cell(ofType: .jungle, ownedBy: .player2, withPiece: Piece(withOwner: .player2, andAnimal: .lion)),
                Cell(ofType: .jungle)
            ]
        ]
        var board : Board = Board(withGrid: grid)!
        return board
    }
    
    public static func checkBoard(b: Board) throws{
        
        guard b.nbRow == 5 && b.nbColumn == 5 else {
            throw InvalidBoardError.badDimensions(5, 5)
        }
        guard b.grid.first?[2].cellType == .den else {
            throw InvalidBoardError.badCellType(b.grid.first![2].cellType, 0, 2)
        }
        guard b.grid.last?[2].cellType == .den else{
            throw InvalidBoardError.badCellType(b.grid.last![2].cellType, b.nbRow, 2)
        }
        var cells = Set<Piece>()
        for row in 0..<b.nbRow{
            for column in 0..<b.nbColumn{
                if let piece = b.grid[row][column].piece, !cells.insert(piece).inserted {
                    throw InvalidBoardError.multipleOccurencesOfSamePiece(piece)
                }
                guard b.grid[row][column].cellType == .jungle || b.grid[row][column].cellType == .den else {
                    throw InvalidBoardError.badCellType(b.grid[row][column].cellType, row, column)
                }
                if let piece = b.grid[row][column].piece, piece.owner == .noOne {
                    throw InvalidBoardError.pieceWithNoOwner(piece)
                }
            }
        }
//        guard b.grid.count(.player1) == 5 && b.grid.count(.player2) == 5 else {
//            throw
//        }
    }
    
    ///Finish
    public func getNextPlayer() -> Owner {
        guard let lastMove = historic.last, lastMove.owner == .player1 else{
            return .player1
        }
        return .player2
        }
    }
    
    

