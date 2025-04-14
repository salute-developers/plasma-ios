import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension ComponentAppearanceVariation<AvatarGroup, AvatarGroupAppearance> {
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

private extension AvatarGroupAppearance {
    
}
