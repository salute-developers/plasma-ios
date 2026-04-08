import Foundation
import Combine
import SDDSComponents
import SDDSThemeCore

final class IconViewModel: ObservableObject {
    @Published var theme: Theme = .sdddsServTheme
    @Published var subtheme: Subtheme = .none

    @Published var mode: IconDemoMode = .tint
    @Published var sideLength: CGFloat = 48
    @Published var useEnvironmentDefaults: Bool = false

    init(theme: Theme = .sdddsServTheme, uiState: IconUiState = .init()) {
        self.theme = theme
        apply(uiState: uiState)
    }

    private func apply(uiState: IconUiState) {
        _ = uiState
    }

    func fillStyleForMode(theme: Theme) -> FillStyle {
        switch mode {
        case .tint:
            return .color(TextIconDemoTokens.accentTextColorToken(theme: theme))
        case .fillColor:
            return .color(TextIconDemoTokens.positiveTextColorToken(theme: theme))
        case .fillGradient:
            return .gradient(TextIconDemoTokens.accentTextGradientToken(theme: theme))
        }
    }

    func iconEnvironmentForMode(theme: Theme) -> SDDSIconEnvironment {
        SDDSIconEnvironment(
            fillStyle: fillStyleForMode(theme: theme),
            defaultSize: sideLength
        )
    }
}

enum IconDemoMode: String, CaseIterable, Identifiable {
    case tint
    case fillColor
    case fillGradient

    var id: String { rawValue }
}
