//
//  ContentView.swift
//  TicTacToe
//
//  Created by Tino on 23/9/21.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var game: Game
    @State private var showingSettings = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background")
                    .ignoresSafeArea()
                
                NavigationLink(destination: GameOverView(), isActive: $game.gameOver) {
                    EmptyView()
                }
                
                NavigationLink(destination: SettingsView(), isActive: $showingSettings) {
                    EmptyView()
                }
                
                VStack {
                    Spacer()
                    Group {
                        Text(currentPlayerText)
                    }
                    .largeText()
                    
                    Spacer()
                    
                    CellsView()
                    
                    Spacer()
                }
                
                settingsButton
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

private extension GameView {
    var currentPlayerText: String {
        var text = "Current player: "
        if game.opponentIsComputer && game.currentPlayer == "O" {
            text += "\(game.currentPlayer) (Computer)"
        } else {
            text += "\(game.currentPlayer)"
        }
        return text
    }
    
    var settingsButton: some View {
        HStack {
            Spacer()
            VStack {
                Button {
                    showingSettings = true
                } label: {
                    Image(systemName: "gearshape")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color("textColour"))
                        .background(Color("cellColour"))
                        .clipShape(Circle())
                }
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameView()
            GameView()
                .previewDisplayName("Dark mode")
                .colorScheme(.dark)
        }
        .environmentObject(Game())
    }
}
