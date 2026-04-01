import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSThemeCore

final class DrawerViewModel: ComponentViewModel<DrawerVariationProvider> {
    @Published var alignment: DrawerAlignment = .bottom
    @Published var showHeader: Bool = false
    @Published var showFooter: Bool = false
    @Published var showOverlay: Bool = false
    @Published var closePlacement: DrawerClosePlacement = .right
    @Published var moveContentEnabled: Bool = false
    @Published var peekOffsetEnabled: Bool = false
    @Published var variationType: DrawerVariationType = .inner {
        didSet {
            variationProvider.variationType = variationType
            if let firstVariation = variations.first {
                selectVariation(firstVariation)
            }
        }
    }
    
    init(theme: Theme = .sdddsServTheme, uiState: DrawerUiState = .init()) {
        super.init(
            variationProvider: DrawerVariationProvider(theme: theme, variationType: uiState.variationType),
            theme: theme
        )
        apply(uiState: uiState)
    }

    private func apply(uiState: DrawerUiState) {
        alignment = uiState.alignment
        showHeader = uiState.showHeader
        showFooter = uiState.showFooter
        showOverlay = uiState.showOverlay
        closePlacement = uiState.closePlacement
        moveContentEnabled = uiState.moveContentEnabled
        peekOffsetEnabled = uiState.peekOffsetEnabled
        variationType = uiState.variationType
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}

