//
//  ContentView.swift
//  TicTacToe
//
//  Created by Tino on 23/9/21.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var game: Game
    
    var body: some View {
        Form {
            Toggle(isOn: $game.opponentIsComputer) {
                Text("Computer opponent")
            }
        }
    }
}

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
//                .onDisappear {
//                    game.reset()
//                }
                
                VStack {
                    Spacer()
                    Text("Current Player: \(game.currentPlayer)")
                        .largeText()
                    
                    Spacer()
                    
                    CellsView()
                    
                    Spacer()
                }
                
                
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
                
            }
            .navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
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
