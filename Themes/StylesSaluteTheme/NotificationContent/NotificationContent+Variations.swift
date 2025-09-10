import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<NotificationContent, NotificationContentAppearance, NotificationContentVariation.Buttonstretch> {
    
    var iconStart: ComponentAppearanceVariation<NotificationContent, NotificationContentAppearance> {
        var size =  NotificationContentAnySize(size: appearance.size)
        size.iconMargin = CGFloat(6.0)
        size.textBoxStartPadding = CGFloat(2.0)
        size.textBoxTopPadding = CGFloat(3.0)

        var appearance = appearance
        appearance.size = size
        appearance.iconPlacement = NotificationContentIconPlacement.start
    
        return .init(
            name: "buttonStretch.iconStart",
            appearance: appearance
        )
    }
    
    var iconTop: ComponentAppearanceVariation<NotificationContent, NotificationContentAppearance> {
        var size =  NotificationContentAnySize(size: appearance.size)
        size.contentEndPadding = CGFloat(6.0)
        size.iconMargin = CGFloat(8.0)
        size.textBoxStartPadding = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
        appearance.iconPlacement = NotificationContentIconPlacement.top
    
        return .init(
            name: "buttonStretch.iconTop",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NotificationContentAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var info: AppearanceVariation<NotificationContentAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<NotificationContentAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<NotificationContentAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<NotificationContentAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.info,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<NotificationContent, NotificationContentAppearance, NotificationContentVariation.Nobuttonstretch> {
    
    var iconStart: ComponentAppearanceVariation<NotificationContent, NotificationContentAppearance> {
        var size =  NotificationContentAnySize(size: appearance.size)
        size.buttonGroupStartPadding = CGFloat(32.0)
        size.iconMargin = CGFloat(6.0)

        var appearance = appearance
        appearance.size = size
        appearance.iconPlacement = NotificationContentIconPlacement.start
    
        return .init(
            name: "noButtonStretch.iconStart",
            appearance: appearance
        )
    }
    
    var iconTop: ComponentAppearanceVariation<NotificationContent, NotificationContentAppearance> {
        var size =  NotificationContentAnySize(size: appearance.size)
        size.iconMargin = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.iconPlacement = NotificationContentIconPlacement.top
    
        return .init(
            name: "noButtonStretch.iconTop",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NotificationContentAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var info: AppearanceVariation<NotificationContentAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<NotificationContentAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<NotificationContentAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<NotificationContentAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.info,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<NotificationContent, NotificationContentAppearance> {
    var `default`: AppearanceVariation<NotificationContentAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var info: AppearanceVariation<NotificationContentAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<NotificationContentAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<NotificationContentAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<NotificationContentAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.info,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension NotificationContentAppearance {
    
    var `default`: NotificationContentAppearance {
        var appearance = self
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
    
    var info: NotificationContentAppearance {
        var appearance = self
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.titleColor = ColorToken.textDefaultInfo
        return appearance
    }
    
    var negative: NotificationContentAppearance {
        var appearance = self
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.titleColor = ColorToken.textDefaultNegative
        return appearance
    }
    
    var positive: NotificationContentAppearance {
        var appearance = self
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.titleColor = ColorToken.textDefaultPositive
        return appearance
    }
    
    var warning: NotificationContentAppearance {
        var appearance = self
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.textColor = ColorToken.textDefaultPrimary
        appearance.titleColor = ColorToken.textDefaultWarning
        return appearance
    }
    
}
