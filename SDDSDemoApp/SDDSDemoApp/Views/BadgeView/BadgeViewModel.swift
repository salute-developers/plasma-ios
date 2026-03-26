import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class BadgeViewModel: ComponentViewModel<BadgeVariationProvider> {
    @Published var iconVisible: Bool = true
    @Published var alignment: SDDSComponents.BadgeAlignment = .leading
    @Published var label: String = "Label"
    @Published var badgeType: BadgeType = .badge {
        didSet {
            self.variationProvider.badgeType = badgeType
            self.selectVariation(variations.first)
        }
    }
    
    var badgeStyle: BadgeStyle {
        switch badgeType {
        case .badge, .badgeClear, .badgeTransparent:
            return .basic
        case .iconBadge, .iconBadgeClear, .iconBadgeTransparent:
            return .icon
        }
    }
    
    init(
        theme: Theme = .sdddsServTheme,
        uiState: BadgeUiState = .init(),
        componentViewLayoutMode: ComponentViewLayoutMode = .screen
    ) {
        super.init(
            variationProvider: BadgeVariationProvider(theme: theme, badgeType: uiState.badgeType),
            componentViewLayoutMode: componentViewLayoutMode,
            theme: theme
        )
        apply(uiState: uiState)
    }

    private func apply(uiState: BadgeUiState) {
        iconVisible = uiState.iconVisible
        alignment = uiState.alignment
        label = uiState.label
        badgeType = uiState.badgeType
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
