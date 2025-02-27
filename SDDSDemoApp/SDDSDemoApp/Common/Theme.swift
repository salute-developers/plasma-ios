import Foundation
import SDDSComponents
import SDDSServTheme
import PlasmaB2CTheme
import StylesSaluteTheme

enum Theme: String, CaseIterable {
    case sdddsServTheme
    case plasmaB2CTheme
    case stylesSalute
    
    var name: String {
        rawValue.capitalized
    }
    
    var basicButtonVariations: [Variation<ButtonAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.BasicButton.all
        case .stylesSalute:
            return StylesSaluteTheme.BasicButton.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.BasicButton.all
        }
    }
    
    var iconButtonVariations: [Variation<ButtonAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.IconButton.all
        case .stylesSalute:
            return StylesSaluteTheme.BasicButton.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.IconButton.all
        }
    }
    
    var linkButtonVariations: [Variation<ButtonAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.LinkButton.all
        case .stylesSalute:
            return StylesSaluteTheme.LinkButton.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.LinkButton.all
        }
    }
    
    var textFieldVariations: [Variation<TextFieldAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.TextField.all
        case .stylesSalute:
            return StylesSaluteTheme.TextField.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.TextField.all
        }
    }
    
    var textFieldClearVariations: [Variation<TextFieldAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.TextFieldClear.all
        case .stylesSalute:
            return StylesSaluteTheme.TextFieldClear.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.TextFieldClear.all
        }
    }
    
    var textAreaVariations: [Variation<TextAreaAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.TextArea.all
        case .stylesSalute:
            return StylesSaluteTheme.TextArea.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.TextArea.all
        }
    }
    
    var textAreaClearVariations: [Variation<TextAreaAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.TextAreaClear.all
        case .stylesSalute:
            return StylesSaluteTheme.TextAreaClear.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.TextAreaClear.all
        }
    }
    
    var avatarVariations: [Variation<AvatarAppearance>] {
        let fallback = SDDSServTheme.Avatar.all
        
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Avatar.all
        case .stylesSalute:
            return fallback
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Avatar.all
        }
    }
    
    var counterVariations: [Variation<CounterAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.SDDSCounter.all
        case .stylesSalute:
            return StylesSaluteTheme.Counter.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Counter.all
        }
    }
    
    var chipGroupVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.ChipGroup.all
        case .stylesSalute:
            return StylesSaluteTheme.ChipGroup.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.ChipGroup.all
        }
    }
    
    var checkboxVariations: [Variation<CheckboxAppearance>] {
        let fallback = SDDSServTheme.Checkbox.all
        
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Checkbox.all
        case .stylesSalute:
            return fallback
        case .plasmaB2CTheme:
            return fallback
        }
    }
    
    var radioboxVariations: [Variation<RadioboxAppearance>] {
        let fallback = SDDSServTheme.Radiobox.all
        
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Radiobox.all
        case .stylesSalute:
            return fallback
        case .plasmaB2CTheme:
            return fallback
        }
    }
    
    var chipVariations: [Variation<ChipAppearance>] {
        let fallback = SDDSServTheme.Chip.all
        
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Chip.all
        case .stylesSalute:
            return fallback
        case .plasmaB2CTheme:
            return fallback
        }
    }
    
    var embeddedChipVariations: [Variation<ChipAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.EmbeddedChip.all
        case .stylesSalute:
            return StylesSaluteTheme.EmbeddedChip.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.EmbeddedChip.all
        }
    }
    
    var progressBarVariations: [Variation<ProgressBarAppearance>] {
        let fallback: [Variation<ProgressBarAppearance>] = SDDSServTheme.ProgressBar.all
        
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.ProgressBar.all
        case .stylesSalute:
            return fallback
        case .plasmaB2CTheme:
            return fallback
        }
    }
    
    var segmentItemVariations: [Variation<SegmentItemAppearance>] {
        let fallback: [Variation<SegmentItemAppearance>] = SDDSServTheme.SegmentItem.all
        
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.SegmentItem.all
        case .stylesSalute:
            return fallback
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.SegmentItem.all
        }
    }
    
    var segmentVariations: [Variation<SegmentAppearance>] {
        let fallback: [Variation<SegmentAppearance>] = SDDSServTheme.Segment.all
        
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Segment.all
        case .stylesSalute:
            return fallback
        case .plasmaB2CTheme:
            return fallback
        }
    }
    
    var switchVariations: [Variation<SwitchAppearance>] {
        let fallback: [Variation<SwitchAppearance>] = SDDSServTheme.Switch.all
        
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Switch.all
        case .stylesSalute:
            return StylesSaluteTheme.Switch.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Switch.all
        }
    }
    
    var badgeVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Badge.all
        case .stylesSalute:
            return StylesSaluteTheme.Badge.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Badge.all
        }
    }
    
    var badgeClearVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.BadgeClear.all
        case .stylesSalute:
            return StylesSaluteTheme.BadgeClear.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.BadgeClear.all
        }
    }
    
    var badgeTransparentVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.BadgeTransparent.all
        case .stylesSalute:
            return StylesSaluteTheme.BadgeTransparent.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.BadgeTransparent.all
        }
    }
    
    var iconBadgeVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.IconBadge.all
        case .stylesSalute:
            return StylesSaluteTheme.IconBadge.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.IconBadge.all
        }
    }
    
    var iconBadgeClearVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.IconBadgeClear.all
        case .stylesSalute:
            return StylesSaluteTheme.IconBadgeClear.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.IconBadgeClear.all
        }
    }
    
    var iconBadgeTransparentVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.IconBadgeTransparent.all
        case .stylesSalute:
            return StylesSaluteTheme.IconBadgeTransparent.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.IconBadgeTransparent.all
        }
    }
    
    var indicatorVariations: [Variation<IndicatorAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Indicator.all
        case .stylesSalute:
            return StylesSaluteTheme.Indicator.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Indicator.all
        }
    }
    
    var cellVariations: [Variation<CellAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Cell.all
        case .stylesSalute:
            return StylesSaluteTheme.Cell.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Cell.all
        }
    }
}
