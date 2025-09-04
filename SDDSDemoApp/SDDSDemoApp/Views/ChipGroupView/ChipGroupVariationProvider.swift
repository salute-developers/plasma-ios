import Foundation
import SDDSComponents
import SDDSServTheme

final class ChipGroupVariationProvider: VariationProvider {
    typealias Appearance = ChipGroupAppearance
    
    var theme: Theme
    var gapStyle: ChipGroupGapStyle
    var chipGroupStyle: ChipGroupStyle
    
    init(theme: Theme = .sdddsServTheme, gapStyle: ChipGroupGapStyle, chipGroupStyle: ChipGroupStyle) {
        self.theme = theme
        self.gapStyle = gapStyle
        self.chipGroupStyle = chipGroupStyle
    }
    
    var variations: [Variation<ChipGroupAppearance>] {
        switch chipGroupStyle {
        case .default:
            guard gapStyle == .dense  else {
                return theme.chipGroupWideVariations
            }
            return theme.chipGroupDenseVariations
        case .embedded:
            guard gapStyle == .dense  else {
                return theme.embeddedChipGroupWideVariations
            }
            return theme.embeddedChipGroupDenseVariations
        }
    }
    
    var defaultValue: ChipGroupAppearance {
        ChipGroupAppearance.defaultValue
    }
}
