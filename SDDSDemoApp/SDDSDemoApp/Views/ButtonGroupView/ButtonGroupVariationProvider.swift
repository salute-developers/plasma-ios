import Foundation
import SDDSComponents
import SDDSServTheme

final class ButtonGroupVariationProvider: VariationProvider {
    typealias Appearance = ButtonGroupAppearance
    
    var buttonGroupType: SDDSButtonGroupType
    var theme: Theme
    
    init(buttonGroupType: SDDSButtonGroupType, theme: Theme = .sdddsServTheme) {
        self.buttonGroupType = buttonGroupType
        self.theme = theme
    }
    
    var variations: [Variation<ButtonGroupAppearance>] {
        switch buttonGroupType {
        case .basic:
            return theme.basicButtonGroupVariations
        case .icon:
            return theme.iconButtonGroupVariations
        }
    }
    
    var defaultValue: ButtonGroupAppearance {
        ButtonGroupAppearance.defaultValue
    }
}
