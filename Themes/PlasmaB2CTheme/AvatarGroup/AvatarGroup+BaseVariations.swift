import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct AvatarGroup {
    public static var s: ComponentAppearanceVariation<AvatarGroup, AvatarGroupAppearance> {
        var appearance = AvatarGroupAppearance.base
        appearance.size = AvatarGroupSize.s
        appearance.avatarAppearance = Avatar.s.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<AvatarGroupAppearance>] = [
        AvatarGroup.s.variation,
    ]
}

public struct AvatarGroupVariation {
    public struct S {}
}

private extension AvatarGroupAppearance {
    static var base: AvatarGroupAppearance {
        var appearance = AvatarGroupAppearance()
        return appearance
    }
}
