import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore



public extension ComponentAppearanceVariation<Popover, PopoverAppearance> {
    var `default`: AppearanceVariation<PopoverAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<PopoverAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension PopoverAppearance {
    
    var `default`: PopoverAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        return appearance
    }
    
    var accent: PopoverAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultAccentMain
        return appearance
    }
    
}
