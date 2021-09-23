//
//  LargeGreenText.swift
//  LargeGreenText
//
//  Created by Tino on 23/9/21.
//

import SwiftUI

struct LargeText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color("textColour"))
    }
}

extension View {
    func largeText() -> some View {
        modifier(LargeText())
    }
}
