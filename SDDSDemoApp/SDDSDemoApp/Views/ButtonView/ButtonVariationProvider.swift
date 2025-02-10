import Foundation
import SDDSComponents
import SDDSServTheme

final class ButtonVariationProvider: VariationProvider {
    typealias Appearance = ButtonAppearance
    
    var buttonType: SDDSButtonType
    
    init(buttonType: SDDSButtonType) {
        self.buttonType = buttonType
    }
    
    var variations: [Variation<ButtonAppearance>] {
        switch buttonType {
        case .basic:
            BasicButton.all
        case .link:
            LinkButton.all
        case .icon:
            IconButton.all
        }
    }
    
    var defaultValue: ButtonAppearance {
        variations.first?.appearance ?? BasicButton.l.default.appearance
    }
}
