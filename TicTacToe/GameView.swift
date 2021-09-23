//
//  ContentView.swift
//  TicTacToe
//
//  Created by Tino on 23/9/21.
//

import SwiftUI

struct GameView: View {
    let size = 130.0
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            GridView(rows: 3, columns: 3) { rows, columns in
                CellView()
                    .frame(width: size, height: size)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
        GameView()
            .previewDisplayName("Dark mode")
            .colorScheme(.dark)
            
    }
}
