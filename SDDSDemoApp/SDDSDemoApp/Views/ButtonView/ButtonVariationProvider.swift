import Foundation
import SDDSComponents
import SDDSServTheme

final class ButtonVariationProvider: VariationProvider {
    typealias Appearance = ButtonAppearance
    
    var buttonType: SDDSButtonType
    var theme: Theme
    
    init(buttonType: SDDSButtonType, theme: Theme = .sdddsServTheme) {
        self.buttonType = buttonType
        self.theme = theme
    }
    
    var variations: [Variation<ButtonAppearance>] {
        switch buttonType {
        case .basic:
            theme.basicButtonVariations
        case .link:
            theme.linkButtonVariations
        case .icon:
            theme.iconButtonVariations
        }
    }
    
    var defaultValue: ButtonAppearance {
        variations.first?.appearance ?? BasicButton.l.default.appearance
    }
}
