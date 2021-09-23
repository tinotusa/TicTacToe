//
//  ContentView.swift
//  TicTacToe
//
//  Created by Tino on 23/9/21.
//

import SwiftUI
// TODO: add win logic
// TODO: restart button
// TODO: popup when no one wins

struct LargeGreenText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color("textColour"))
    }
}

extension View {
    func largeGreenText() -> some View {
        modifier(LargeGreenText())
    }
}

struct GameOverView: View {
    @EnvironmentObject var game: Game
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                Text("Game over")
                    .largeGreenText()
                
                Spacer()
                Text("The winner: \(game.winner)")
                    .largeGreenText()
                Button("Play again") {
                    game.reset()
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .background(Color("cellColour"))
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct GameView: View {
    @EnvironmentObject var game: Game

    var body: some View {
        NavigationView {
            ZStack {
                Color("background")
                    .ignoresSafeArea()
                
                NavigationLink(destination: GameOverView(), isActive: $game.gameOver) {
                    EmptyView()
                }
                
                VStack {
                    Text("Current Player: \(game.currentPlayer)")
                        .largeGreenText()
                    Spacer()
                    CellsView()
                    Spacer()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
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
