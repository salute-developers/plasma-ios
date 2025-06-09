import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct NotificationLoose {
    public static var l: ComponentAppearanceVariation<NotificationLoose, NotificationAppearance> {
        var appearance = NotificationAppearance.base
        appearance.size = NotificationLooseSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<NotificationLoose, NotificationAppearance> {
        var appearance = NotificationAppearance.base
        appearance.size = NotificationLooseSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<NotificationLoose, NotificationAppearance> {
        var appearance = NotificationAppearance.base
        appearance.size = NotificationLooseSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<NotificationAppearance>] = [
        NotificationLoose.l.variation,
        NotificationLoose.m.variation,
        NotificationLoose.s.variation,
    ]
}

public struct NotificationLooseVariation {
    public struct L {}
    public struct M {}
    public struct S {}
}

private extension NotificationAppearance {
    static var base: NotificationAppearance {
        var appearance = NotificationAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        appearance.closeColor = ColorToken.textDefaultSecondary
        return appearance
    }
}
