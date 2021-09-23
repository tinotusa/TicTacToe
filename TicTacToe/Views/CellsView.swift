//
//  CellsView.swift
//  CellsView
//
//  Created by Tino on 23/9/21.
//

import SwiftUI

struct CellsView: View {
    @EnvironmentObject var game: Game
    let size = 130.0
    
    var body: some View {
        GridView { row, column in
            CellGridItem(token: game.tokenAt(row: row, column: column))
                .frame(width: size, height: size)
                .onTapGesture {
                    game.updateCell(row, column)
                    game.checkWinner()
                    game.switchPlayer()
                }
                .disabled(!game.cellIsAvailable(row, column))
        }
    }
}

struct CellsView_Previews: PreviewProvider {
    static var previews: some View {
        CellsView()
            .environmentObject(Game())
    }
}
