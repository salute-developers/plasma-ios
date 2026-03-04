import Foundation
import SDDSComponents

final class EditableVariationProvider: VariationProvider {
    typealias Appearance = EditableAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<EditableAppearance>] {
        theme.editableVariations
    }
    
    var defaultValue: EditableAppearance {
        EditableAppearance.defaultValue
    }
}
