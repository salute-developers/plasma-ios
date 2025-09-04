//
//  ContentView.swift
//  IntegrationExample
//
//  Created by Vladimir Kaltyrin on 04.09.2025.
//

import SwiftUI
import SDDSIcons
import SDDSThemeCore
import SDDSComponents
import SDDSservTheme
import PlasmaB2CTheme
import PlasmaHomeDSTheme
import StylesSaluteTheme

struct ContentView: View {
    var body: some View {
        VStack {
            SDDSIcons.Asset.accessibility16.image
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundStyle(PlasmaB2CTheme.Colors.textDefaultAccent.token.color())
            
            BasicButton(title: "Title", subtitle: "Subtitle", appearance: SDDSservTheme.BasicButton.m.accent.appearance) {}
            
            BasicButton(title: "Title", subtitle: "Subtitle", appearance: PlasmaB2CTheme.BasicButton.m.accent.appearance) {}
            
            BasicButton(title: "Title", subtitle: "Subtitle", appearance: PlasmaHomeDSTheme.BasicButton.m.default.appearance) {}
            
            BasicButton(title: "Title", subtitle: "Subtitle", appearance: StylesSaluteTheme.BasicButton.m.accent.appearance) {}
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
