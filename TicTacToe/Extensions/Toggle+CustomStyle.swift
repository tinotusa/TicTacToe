//
//  Toggle+CustomStyle.swift
//  Toggle+CustomStyle
//
//  Created by Tino on 23/9/21.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    let width = 60.0
    let height = 30.0
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: width, height: height)
                    .foregroundColor(configuration.isOn ? Color("cellColour") : .gray)
                
                Circle()
                    .foregroundColor(.white)
                    .frame(width: height - 5, height: height)
                    .offset(x: configuration.isOn ? height / 2 : -height / 2)
            }
        }
        .onTapGesture {
            withAnimation {
                configuration.isOn.toggle()
            }
        }
    }
}

extension ToggleStyle where Self == CustomToggleStyle {
    static var customToggleStyle: CustomToggleStyle { CustomToggleStyle() }
}
