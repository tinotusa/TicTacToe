//
//  CellView.swift
//  CellView
//
//  Created by Tino on 23/9/21.
//

import SwiftUI

struct CellView: View {
    // TODO: - STUFF
    // need to know who is placing
    // don't know if each cell should be responsible for knowing if its used
    @State private var isEmpty = true
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("cellColour"))
                .shadow(color: .black, radius: 5, x: 0, y: 6)
            if !isEmpty {
                Text("X") // TODO: - EDIT ME
                    .font(.system(size: 100))
                    .foregroundColor(Color("textColour"))
            }
        }
        .onTapGesture {
            isEmpty = false
        }
        .disabled(!isEmpty)
    }
}

struct CellView_Previews: PreviewProvider {
    static let size = 808.0
    static var previews: some View {
        CellView()
//            .previewLayout(.fixed(width: size, height: size)) // this crashed all previews (must restart to fix)
    }
}
