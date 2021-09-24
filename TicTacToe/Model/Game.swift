//
//  Game.swift
//  Game
//
//  Created by Tino on 23/9/21.
//

import SwiftUI

final class Game: ObservableObject {
    // model
    @Published private var gameData = GameData()
    
    var cells: [String] {
        gameData.cells
    }
    
    var currentPlayer: String {
        gameData.currentPlayer
    }
    
    var gameOver: Bool {
        get { gameData.gameOver }
        set { gameData.gameOver = newValue }
    }
    
    var opponentIsComputer: Bool {
        get { gameData.opponentIsComputer }
        set { gameData.opponentIsComputer = newValue }
    }
    
    var winner: String {
        gameData.winner ?? "Draw"
    }
    
    func reset() {
        gameData.reset()
    }
    
    func updateCell(_ row: Int, _ column: Int) {
        gameData.updateCell(row, column, token: gameData.currentPlayer)
    }
    
    func updateComputer() {
        gameData.updateComputer()
    }
    
    func tokenAt(row: Int, column: Int) -> String {
        cells[index(row, column)]
    }
    
    func index(_ row: Int, _ column: Int) -> Int {
        gameData.index(row, column)
    }
    
    func switchPlayer() {
        gameData.switchPlayer()
    }
    
    func cellIsAvailable(_ row: Int, _ column: Int) -> Bool {
        gameData.cellIsAvailable(row, column)
    }
}
