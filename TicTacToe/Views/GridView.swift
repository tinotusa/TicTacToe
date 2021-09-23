//
//  GridView.swift
//  GridView
//
//  Created by Tino on 23/9/21.
//

import SwiftUI

struct GridView<Content>: View where Content: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    init(rows: Int = 3,
         columns: Int = 3,
         @ViewBuilder content: @escaping (Int, Int) -> Content)
    {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
    
    var body: some View {
        HStack {
            ForEach(0 ..< rows) { rowIndex in
                VStack {
                    ForEach(0 ..< columns) { columnIndex in
                        content(rowIndex, columnIndex)
                    }
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView { rows, columns in
            Text("hello world")
        }
    }
}
