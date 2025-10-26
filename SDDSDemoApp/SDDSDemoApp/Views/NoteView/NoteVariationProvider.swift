import Foundation
import SDDSComponents
import SDDSServTheme

final class NoteVariationProvider: VariationProvider {
    typealias Appearance = NoteAppearance
    
    var theme: Theme
    
    init(theme: Theme = .sdddsServTheme) {
        self.theme = theme
    }
    
    var variations: [Variation<NoteAppearance>] {
        theme.noteVariations
    }
    
    var defaultValue: NoteAppearance {
        NoteAppearance.defaultValue
    }
}
