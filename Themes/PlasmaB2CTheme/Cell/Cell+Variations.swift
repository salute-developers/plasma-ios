import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public extension ComponentAppearanceVariation<Cell<Avatar, IconButton, AnyView>, CellAppearance> {
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension CellAppearance {
    
}
