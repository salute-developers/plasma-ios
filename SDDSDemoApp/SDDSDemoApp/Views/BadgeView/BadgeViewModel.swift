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
    
    init(componentViewLayoutMode: ComponentViewLayoutMode = .screen) {
        super.init(variationProvider: BadgeVariationProvider(badgeType: .badge), componentViewLayoutMode: componentViewLayoutMode)
    }
}
