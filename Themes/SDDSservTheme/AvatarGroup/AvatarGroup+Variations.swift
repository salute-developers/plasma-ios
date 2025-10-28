import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<AvatarGroup, AvatarGroupAppearance, AvatarGroupVariation.S> {
    
    var s: ComponentAppearanceVariation<AvatarGroup, AvatarGroupAppearance> {
        var size =  AvatarGroupAnySize(size: appearance.size)
        size.borderWidth = CGFloat(2.0)
        size.spacing = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.avatarAppearance = Avatar.s.appearance
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
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
