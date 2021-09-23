//
//  SettingsView.swift
//  SettingsView
//
//  Created by Tino on 23/9/21.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var game: Game
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            backButton
            
            VStack {
                settingsTitle
                
                Spacer()
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        Spacer()
                        Group {
                            computerSetting
                            Text("something selse")
                        }
                        .settingsBorder()
                    }
                }
                .foregroundColor(Color("textColour"))
                .padding(.horizontal)
            }
        }
        .navigationBarHidden(true)
    }
}

private extension SettingsView {
    var computerSetting: some View {
        Toggle(isOn: $game.opponentIsComputer) {
            Text("Computer opponent")
                .font(.title2)
                .foregroundColor(Color("textColour"))
        }
//                .toggleStyle(SwitchToggleStyle(tint: Color("cellColour")))
        .toggleStyle(.customToggleStyle)
    }
    
    var settingsTitle: some View {
        HStack {
            Spacer()
            Text("Settings")
                .largeText()
            Spacer()
        }
    }
    
    var backButton: some View {
        HStack {
            VStack {
                Button{
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.largeTitle)
                        .foregroundColor(Color("textColour"))
                }
                .zIndex(1)
                
                Spacer()
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(Game())
    }
}
