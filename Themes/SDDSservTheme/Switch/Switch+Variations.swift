import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public extension ComponentAppearanceVariation<Switch, SwitchAppearance> {
    var `default`: AppearanceVariation<SwitchAppearance> {
        .init(name: "default", appearance: self.appearance)
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`
            ],
            name: name,
            appearance: appearance
        )
    }
}
