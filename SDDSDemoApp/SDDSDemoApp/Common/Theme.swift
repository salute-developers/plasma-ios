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
            return StylesSaluteTheme.IconButton.all
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
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Avatar.all
        case .stylesSalute:
            return StylesSaluteTheme.Avatar.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Avatar.all
        }
    }
    
    var avatarGroupVariations: [Variation<AvatarGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.AvatarGroup.all
        case .stylesSalute:
            return StylesSaluteTheme.AvatarGroup.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.AvatarGroup.all
        }
    }
    
    var counterVariations: [Variation<CounterAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Counter.all
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
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Checkbox.all
        case .stylesSalute:
            return StylesSaluteTheme.Checkbox.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Checkbox.all
        }
    }
    
    var checkboxGroupVariations: [Variation<CheckboxGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.CheckboxGroup.all
        case .stylesSalute:
            return StylesSaluteTheme.CheckboxGroup.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.CheckboxGroup.all
        }
    }
    
    var radioboxVariations: [Variation<RadioboxAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Radiobox.all
        case .stylesSalute:
            return StylesSaluteTheme.Radiobox.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Radiobox.all
        }
    }
    
    var radioboxGroupVariations: [Variation<RadioboxGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.RadioboxGroup.all
        case .stylesSalute:
            return StylesSaluteTheme.RadioboxGroup.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.RadioboxGroup.all
        }
    }
    
    var chipVariations: [Variation<ChipAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Chip.all
        case .stylesSalute:
            return StylesSaluteTheme.Chip.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Chip.all
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
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.ProgressBar.all
        case .stylesSalute:
            return StylesSaluteTheme.ProgressBar.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.ProgressBar.all
        }
    }
    
    var segmentItemVariations: [Variation<SegmentItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.SegmentItem.all
        case .stylesSalute:
            return StylesSaluteTheme.SegmentItem.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.SegmentItem.all
        }
    }
    
    var segmentVariations: [Variation<SegmentAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Segment.all
        case .stylesSalute:
            return StylesSaluteTheme.Segment.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Segment.all
        }
    }
    
    var switchVariations: [Variation<SwitchAppearance>] {
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
    
    var cardVariations: [Variation<CardAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Card.all
        case .stylesSalute:
            return []
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Card.all
        }
    }
    
    var cardClearVariations: [Variation<CardAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.CardClear.all
        case .stylesSalute:
            return []
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.CardClear.all
        }
    }
    
    var bottomSheetVariations: [Variation<BottomSheetAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.BottomSheet.all
        case .stylesSalute:
            return StylesSaluteTheme.BottomSheet.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.BottomSheet.all
        }
    }
    
    var circularProgressBarVariations: [Variation<CircularProgressBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.CircularProgressBar.all
        case .stylesSalute:
            return []
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.CircularProgressBar.all
        }
    }
}
