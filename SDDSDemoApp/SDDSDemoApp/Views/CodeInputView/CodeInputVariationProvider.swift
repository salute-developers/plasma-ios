import Foundation
import SDDSComponents
import SDDSServTheme

final class CodeInputVariationProvider: VariationProvider {
    typealias Appearance = CodeInputAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }

    var variations: [Variation<CodeInputAppearance>] {
        theme.codeInputVariations
    }
    
    var defaultValue: CodeInputAppearance {
        CodeInputAppearance()
    }
}
