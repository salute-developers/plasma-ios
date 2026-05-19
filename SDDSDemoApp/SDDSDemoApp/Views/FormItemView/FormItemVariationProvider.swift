import Foundation
import SDDSComponents

final class FormItemVariationProvider: VariationProvider {
    typealias Appearance = FormItemAppearance

    var theme: Theme

    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }

    var variations: [Variation<FormItemAppearance>] {
        theme.formItemVariations
    }

    var defaultValue: FormItemAppearance {
        FormItemAppearance.defaultValue
    }
}
