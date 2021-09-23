//
//  GameOverView.swift
//  GameOverView
//
//  Created by Tino on 23/9/21.
//

import SwiftUI

struct GameOverView: View {
    @EnvironmentObject var game: Game
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
             
                Group {
                    Text("Game over")
                    Text("The winner: \(game.winner)")
                }
                .largeText()

                Button("Play again") {
                    game.reset()
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .foregroundColor(Color("textColour"))
                .background(Color("cellColour"))
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.7), radius: 5, x: 0, y: 6)
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
            .environmentObject(Game())
    }
}
