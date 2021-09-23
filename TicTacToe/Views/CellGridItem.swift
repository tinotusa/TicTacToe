//
//  CellView.swift
//  CellView
//
//  Created by Tino on 23/9/21.
//

import SwiftUI

struct CellGridItem: View {
    var token: String = ""
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("cellColour"))
                .shadow(color: .black, radius: 5, x: 0, y: 6)
            Text(token)
                .font(.system(size: 100))
                .foregroundColor(Color("textColour"))
        }
    }
}

struct CellGridItem_Previews: PreviewProvider {
    static let size = 808.0
    static var previews: some View {
        CellGridItem()
    }
}
