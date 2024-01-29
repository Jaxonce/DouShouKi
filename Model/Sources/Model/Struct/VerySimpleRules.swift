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
    
    static let NB_ROW = 5
    static let NB_COLUMN = 5
    
    public init() {
        self.occurences = [Board : Int]()
        self.historic = [Move]()
    }
    
    /// Get all moves for all pieces of an owner
    /// - Parameters:
    ///   - board: actual board
    ///   - owner: owner we want his possible moves
    /// - Returns: an array of moves
    public func getMoves(board: Board, owner: Owner) -> [Move] {
        var tabMove : [Move] = []
        for cell in getPieces(board: board, owner: owner) {
            tabMove.append(contentsOf: getMoves(board: board, owner: owner, withRaw: cell.row, andColumn: cell.column))
        }
        return tabMove
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
        isMoveValid(board: board, canMove: Move(owner: getNextPlayer(), rowOrigin: initialRow, colomnOrigin: initialColumn, rowDestination: destinationRow, columnDestination: destinationColumn))
    }
    
    /// Meme fonction que celle du dessus, mais au lieu de passer directement les coordonnées, on passe un move
    /// - Parameters:
    ///   - board: board acutelle
    ///   - move: représente le coup que le joueur veut faire
    /// - Returns: true si le move est valide, false si il ne l'est pas
    public func isMoveValid(board: Board, canMove move: Move) -> Bool {
        if move.rowOrigin < 0 || move.colomnOrigin < 0 || move.rowDestination < 0 || move.columnDestination < 0 {
            return false
        }
        if move.rowOrigin > 4 || move.colomnOrigin > 4 || move.rowDestination > 4 || move.columnDestination > 4 {
            return false
        }
        let destinationCell = board.grid[move.rowDestination][move.columnDestination]
        let initialCell = board.grid[move.rowOrigin][move.colomnOrigin]
        if board.grid[move.rowOrigin][move.colomnOrigin] == board.grid[move.rowDestination][move.columnDestination] {
            return false
        }
        if destinationCell.piece?.owner == initialCell.piece?.owner {
            return false
        }
        guard abs(move.rowOrigin - move.rowDestination) == 1 || abs(move.rowOrigin - move.rowDestination) == 0 || abs(move.colomnOrigin - move.columnDestination) == 1 || abs(move.colomnOrigin - move.columnDestination) == 0 else{
            return false
        }
//        if destinationCell.piece != nil {
//            return false
//        }
        guard let pieceDestination = destinationCell.piece, canKill(animal1: pieceDestination.animal, canKill: initialCell.piece!.animal) else {
            return true
        }
        return false
        ///A verif il y a peut etre d'autre verif a faire
        ///!(column-1 < 0)
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
        ///Verif nombre de piece du joueur actuel
        guard board.countPieces(of: getNextPlayer()) != 0 else{
            return (true, .winner(getPlayer(), .noMovesLeft))
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
        
        let grid : [[Cell]] =
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
        return Board(withGrid: grid)!
    }
    
    public static func checkBoard(b: Board) throws{
        
        guard b.nbRow == VerySimpleRules.NB_ROW && b.nbColumn == VerySimpleRules.NB_COLUMN else {
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
        if historic.isEmpty {
            return .player1
        }
        guard let lastMove = historic.last, lastMove.owner == .player1 else{
            return .player1
        }
        return .player2
    }
    
    /// Get the actual player
    /// - Returns: the actual owner
    public func getPlayer() -> Owner {
        if let owner = historic.last?.owner, owner == .player1 {
            return .player1
        }
        return .player2
    }
    
    /// Est ce que un animal peut tuer un autre
    /// - Parameters:
    ///   - piece1: 1st Piece
    ///   - piece2: 2nd Piece
    /// - Returns: True si l'animal peut manger l'autre, sinon false (exception pour l'elephant et le rat
    public func canKill(animal1 : Animal,canKill animal2: Animal) -> Bool {
        if animal1 == .rat && animal2 == .elephant {
            return true
        }
        if animal1 == .elephant && animal2 == .rat {
            return false
        }
        if animal1 > animal2 {
            return true
        }
        return false
    }
    
    /// Get piece of an owner for a given board
    /// - Parameters:
    ///   - board: actual board
    ///   - owner: the owner we want his piece
    /// - Returns: a tuple with the localisation of each owner's pieces in the board
    public func getPieces(board: Board, owner: Owner) -> [(row: Int, column: Int)] {
        var tabPiece : [(Int, Int)] = []
        for row in 0..<board.nbRow {
            for column in 0..<board.nbColumn {
                if let piece = board.grid[row][column].piece, piece.owner == owner {
                    tabPiece.append((row,column))
                }
            }
        }
        return tabPiece
    }
}
    
    

