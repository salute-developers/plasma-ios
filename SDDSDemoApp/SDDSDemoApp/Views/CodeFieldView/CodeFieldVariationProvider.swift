import Foundation
import SDDSComponents

final class CodeFieldVariationProvider: VariationProvider {
    typealias Appearance = CodeFieldAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }

    var variations: [Variation<CodeFieldAppearance>] {
        theme.codeFieldVariations
    }
    
    var defaultValue: CodeFieldAppearance {
        CodeFieldAppearance()
    }
}
