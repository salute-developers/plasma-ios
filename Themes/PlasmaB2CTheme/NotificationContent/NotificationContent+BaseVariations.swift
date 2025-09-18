import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct NotificationContent {
    public static var buttonStretch: GeneralAppearanceVariation<NotificationContent, NotificationContentAppearance, NotificationContentVariation.Buttonstretch> {
        var appearance = NotificationContentAppearance.base
        appearance.size = NotificationContentSize.buttonStretch
        appearance.buttonGroupAppearance = BasicButtonGroup.xs.dense.default.appearance
        appearance.buttonLayout = NotificationContentButtonLayout.stretch

        return .init(
            name: "buttonStretch",
            appearance: appearance
        )
    }
    public static var noButtonStretch: GeneralAppearanceVariation<NotificationContent, NotificationContentAppearance, NotificationContentVariation.Nobuttonstretch> {
        var appearance = NotificationContentAppearance.base
        appearance.size = NotificationContentSize.noButtonStretch
        appearance.buttonGroupAppearance = BasicButtonGroup.xxs.dense.default.appearance
        appearance.buttonLayout = NotificationContentButtonLayout.normal

        return .init(
            name: "noButtonStretch",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<NotificationContentAppearance>] = [
        NotificationContent.buttonStretch.variation,
        NotificationContent.buttonStretch.iconStart.variation,
        NotificationContent.buttonStretch.iconTop.variation,
        NotificationContent.noButtonStretch.variation,
        NotificationContent.noButtonStretch.iconStart.variation,
        NotificationContent.noButtonStretch.iconTop.variation,
    ]
}

public struct NotificationContentVariation {
    public struct Buttonstretch {}
    public struct ButtonstretchIconstart {}
    public struct ButtonstretchIcontop {}
    public struct Nobuttonstretch {}
    public struct NobuttonstretchIconstart {}
    public struct NobuttonstretchIcontop {}
}

private extension NotificationContentAppearance {
    static var base: NotificationContentAppearance {
        var appearance = NotificationContentAppearance()
        appearance.textTypography = NotificationContentTypography(oneSize: AdaptiveTypographyToken.textSNormal.typography).asContainer
        appearance.titleTypography = NotificationContentTypography(oneSize: AdaptiveTypographyToken.bodySBold.typography).asContainer
        return appearance
    }
}
