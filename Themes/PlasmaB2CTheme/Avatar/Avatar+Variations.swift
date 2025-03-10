import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public extension ComponentAppearanceVariation<Avatar, AvatarAppearance> {
    var `default`: AppearanceVariation<AvatarAppearance> {
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
