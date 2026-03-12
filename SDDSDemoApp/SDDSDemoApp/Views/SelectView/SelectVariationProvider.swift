import Foundation
import SDDSComponents

enum SelectDemoLayout: String, CaseIterable {
    case normal
    case tight
}

enum SelectDemoMode: String, CaseIterable {
    case single
    case multiple
}

final class SelectVariationProvider: VariationProvider {
    typealias Appearance = SelectAppearance
    
    var theme: Theme
    var layout: SelectDemoLayout
    var mode: SelectDemoMode
    
    init(
        theme: Theme = .sdddsServTheme,
        layout: SelectDemoLayout = .normal,
        mode: SelectDemoMode = .single
    ) {
        self.theme = theme
        self.layout = layout
        self.mode = mode
    }
    
    var variations: [Variation<SelectAppearance>] {
        switch (mode, layout) {
        case (.single, .normal):
            return theme.selectSingleNormalVariations
        case (.single, .tight):
            return theme.selectSingleTightVariations
        case (.multiple, .normal):
            return theme.selectMultipleNormalVariations
        case (.multiple, .tight):
            return theme.selectMultipleTightVariations
        }
    }
    
    var defaultValue: SelectAppearance {
        variations.first?.appearance ?? SelectAppearance()
    }
}

