//
//  GameData.swift
//  GameData
//
//  Created by Tino on 23/9/21.
//

struct GameData {
    static let width = 3
    static let height = 3
    static let gridSize = width * height
    
    private(set) var currentPlayer = "X"
    private var tokenCount = 0
    var gameOver = false
    
    var cells: [String] = Array(repeating: "", count: gridSize)
    var winner: String? = nil
    
    mutating func updateCell(_ row: Int, _ column: Int, token: String) {
        let index = index(row, column)
        cells[index] = token
        tokenCount += 1
        
    }
    
    mutating func switchPlayer() {
        if currentPlayer == "X" { currentPlayer = "O" }
        else if currentPlayer == "O" { currentPlayer = "X" }
    }
    
    func index(_ row: Int, _ column: Int) -> Int {
        Self.width * row + column
    }
    
    func cellIsAvailable(_ row: Int, _ column: Int) -> Bool {
        let token = cells[index(row, column)]
        return token.isEmpty
    }
    
    mutating func reset() {
        cells = Array(repeating: "", count: Self.gridSize)
        winner = nil
        currentPlayer = "X"
        tokenCount = 0
        gameOver = false
        
    }
    
    mutating func checkWinner() {
        defer {
            if tokenCount == Self.gridSize {
                gameOver = true
            }
        }
        // check rows
        for row in 0 ..< Self.width {
            var foundWinner = true
            for column in 0 ..< Self.height {
                let index = index(row, column)
                if cells[index].isEmpty || cells[index] != currentPlayer {
                    foundWinner = false
                    break
                }
            }
            if foundWinner {
                winner = currentPlayer
                print("row winner \(currentPlayer)")
                gameOver = true
                return
            }
        }
        
        // check columns
        for column in 0 ..< Self.height {
            var foundWinner = true
            for row in 0 ..< Self.width {
                let index = index(row, column)
                if cells[index].isEmpty || cells[index] != currentPlayer {
                    foundWinner = false
                    break
                }
            }
            if foundWinner {
                winner = currentPlayer
                print("column winner \(currentPlayer)")
                gameOver = true
                return
            }
        }
        
        // check diagonals
        // left to right "\"
        var found = true
        for row in 0 ..< Self.width {
            let index = index(row, row)
            if cells[index].isEmpty || cells[index] != currentPlayer {
                found = false
                break
            }
        }
        if found {
            gameOver = true
            winner = currentPlayer
            print("diagonal left to right winner: \(currentPlayer)")
            return
        }

        // right to left "/"
        found = true
        let startRow = Self.width - 1
        let startColumn = 0
        
        for i in 0 ..< Self.width {
            let index = index(startRow - i, startColumn + i)
            if cells[index].isEmpty || cells[index] != currentPlayer {
                found = false
                break
            }
        }
        if found {
            gameOver = true
            winner = currentPlayer
            return
        }
    }
}
