import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension ComponentAppearanceVariation<Cell, CellAppearance> {
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
