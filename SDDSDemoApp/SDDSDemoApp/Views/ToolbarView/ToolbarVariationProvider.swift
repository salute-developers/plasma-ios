import Foundation
import SDDSComponents
import SDDSServTheme

enum ToolbarType: String, CaseIterable {
    case horizontal = "Toolbar Horizontal"
    case vertical = "Toolbar Vertical"
}

final class ToolbarVariationProvider: VariationProvider {
    typealias Appearance = ToolbarAppearance
    
    var theme: Theme
    var toolbarType: ToolbarType
    
    init(theme: Theme = .sdddsServTheme, toolbarType: ToolbarType = .horizontal) {
        self.theme = theme
        self.toolbarType = toolbarType
    }
    
    var variations: [Variation<ToolbarAppearance>] {
        switch toolbarType {
        case .horizontal:
            return theme.toolbarHorizontalVariations
        case .vertical:
            return theme.toolbarVerticalVariations
        }
    }
    
    var defaultValue: ToolbarAppearance {
        ToolbarAppearance.defaultValue
    }
}
