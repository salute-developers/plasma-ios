import Foundation
import SDDSComponents


public extension AppearanceVariation<AvatarAppearance> {
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSAvatar.default.appearance)
        )
    }
}

public extension SDDSAvatar {
    static var `default`: AppearanceVariation<AvatarAppearance> {
        .init(
            name: "default",
            appearance:
                .init(
                    textFillStyle: .gradient(Gradients.textDefaultAccentGradient),
                    backgroundFillStyle: .gradient(Gradients.surfaceDefaultAccentGradient),
                    backgroundOpacity: 0.2,
                    onlineStatusColor: Colors.textDefaultAccent,
                    offlineStatusColor: Colors.surfaceOnLightSolidTertiary,
                    textTypography: AvatarTypography.title
                )
        )
    }
    
    static var all: [AppearanceVariation<AvatarAppearance>] {
        [
            SDDSAvatar.default
        ]
    }
}
