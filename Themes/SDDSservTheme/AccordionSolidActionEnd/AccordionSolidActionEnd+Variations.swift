import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore



public extension ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
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

private extension AccordionAppearance {
    
}
