import Foundation
import SDDSComponents
import SDDSServTheme

final class NoteCompactVariationProvider: VariationProvider {
    typealias Appearance = NoteCompactAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<NoteCompactAppearance>] {
        theme.noteCompactVariations
    }
    
    var defaultValue: NoteCompactAppearance {
        NoteCompactAppearance.defaultValue
    }
}

