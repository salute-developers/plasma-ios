import SwiftUI
import SDDSThemeCore
import SDDSServTheme

extension View {
    func backgroundColorForSubtheme(_ subtheme: Subtheme, colorScheme: ColorScheme) -> some View {
        self.background(backgroundColorForSubthemeColor(subtheme, colorScheme: colorScheme))
    }
    
    func listRowBackgroundForSubtheme(_ subtheme: Subtheme, colorScheme: ColorScheme) -> some View {
        self.listRowBackground(backgroundColorForSubthemeColor(subtheme, colorScheme: colorScheme))
    }
}

private func backgroundColorForSubthemeColor(_ subtheme: Subtheme, colorScheme: ColorScheme) -> Color {
    switch subtheme {
    case .onDark:
        return Colors.backgroundDarkPrimary.token.color(for: colorScheme)
    case .onLight:
        return Colors.backgroundLightPrimary.token.color(for: colorScheme)
    case .inverse:
        return Colors.backgroundInversePrimary.token.color(for: colorScheme)
    case .default, .none:
        return Colors.backgroundDefaultPrimary.token.color(for: colorScheme)
    }
}

