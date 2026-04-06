import SwiftUI
import SDDSThemeCore

extension View {
    func backgroundColorForSubtheme(_ subtheme: Subtheme, colorScheme: ColorScheme) -> some View {
        self.background(backgroundColorForSubthemeColor(subtheme, colorScheme: colorScheme))
    }
    
    func listRowBackgroundForSubtheme(_ subtheme: Subtheme, colorScheme: ColorScheme) -> some View {
        self.listRowBackground(backgroundColorForSubthemeColor(subtheme, colorScheme: colorScheme))
    }
}

func backgroundColorForSubthemeColor(_ subtheme: Subtheme, colorScheme: ColorScheme) -> Color {
    switch subtheme {
    case .onDark:
        return colorScheme == .dark ? Color.black : Color(white: 0.15)
    case .onLight:
        return colorScheme == .dark ? Color(white: 0.2) : Color.white
    case .inverse:
        return colorScheme == .dark ? Color.white : Color.black
    case .default, .none:
        return Color(.systemBackground)
    }
}

