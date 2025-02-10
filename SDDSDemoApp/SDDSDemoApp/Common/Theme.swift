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
            return fallback
        }
    }
    
    var counterVariations: [Variation<CounterAppearance>] {
        let fallback = SDDSServTheme.Counter.all
        
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Counter.all
        case .stylesSalute:
            return fallback
        case .plasmaB2CTheme:
            return fallback
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
            return fallback
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
            return fallback
        case .plasmaB2CTheme:
            return fallback
        }
    }
}
