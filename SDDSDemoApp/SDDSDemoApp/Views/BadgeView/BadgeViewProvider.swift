import Foundation
import SDDSComponents
import SDDSServTheme

enum BadgeType: String, CaseIterable {
    case badge = "Badge Solid"
    case badgeClear = "Badge Clear"
    case badgeTransparent = "Badge Transparent"
    case iconBadge = "Icon Badge Solid"
    case iconBadgeClear = "Icon Badge Clear"
    case iconBadgeTransparent = "Icon Badge Transparent"
}

final class BadgeVariationProvider: VariationProvider {
    typealias Appearance = BadgeAppearance
    
    var theme: Theme
    var badgeType: BadgeType
    
    init(theme: Theme = .sdddsServTheme, badgeType: BadgeType) {
        self.theme = theme
        self.badgeType = badgeType
    }
    
    var variations: [Variation<BadgeAppearance>] {
        switch badgeType {
        case .badge:
            theme.badgeVariations
        case .badgeClear:
            theme.badgeClearVariations
        case .badgeTransparent:
            theme.badgeTransparentVariations
        case .iconBadge:
            theme.iconBadgeVariations
        case .iconBadgeClear:
            theme.iconBadgeClearVariations
        case .iconBadgeTransparent:
            theme.iconBadgeTransparentVariations
        }
    }
    
    var defaultValue: BadgeAppearance {
        BadgeAppearance.defaultValue
    }
}
