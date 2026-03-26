import Foundation
import SDDSComponents
import SDDSThemeCore

final class NotificationViewModel: ComponentViewModel<NotificationVariationProvider> {
    @Published var text: String = "Notification"
    @Published var position: ToastPosition = .topCenter
    @Published var hasClose: Bool = true
    @Published var layout: NotificationLayout = .compact {
        didSet {
            self.variationProvider.layout = layout
            self.selectVariation(variations.first)
        }
    }
    
    init(theme: Theme = .sdddsServTheme, uiState: NotificationUiState = .init()) {
        super.init(
            variationProvider: NotificationVariationProvider(theme: theme, layout: uiState.layout),
            theme: theme
        )

        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
        apply(uiState: uiState)
    }

    private func apply(uiState: NotificationUiState) {
        text = uiState.text
        position = uiState.position
        hasClose = uiState.hasClose
        layout = uiState.layout
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
