import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct NotificationCompact {
    public static var l: ComponentAppearanceVariation<NotificationCompact, NotificationAppearance> {
        var appearance = NotificationAppearance.base
        appearance.size = NotificationCompactSize.l

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<NotificationCompact, NotificationAppearance> {
        var appearance = NotificationAppearance.base
        appearance.size = NotificationCompactSize.m

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<NotificationCompact, NotificationAppearance> {
        var appearance = NotificationAppearance.base
        appearance.size = NotificationCompactSize.s

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<NotificationAppearance>] = [
        NotificationCompact.l.variation,
        NotificationCompact.m.variation,
        NotificationCompact.s.variation,
    ]
}

public struct NotificationCompactVariation {
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
