//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Tino on 23/9/21.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    @StateObject var game = Game()
    
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(game)
        }
    }
}
