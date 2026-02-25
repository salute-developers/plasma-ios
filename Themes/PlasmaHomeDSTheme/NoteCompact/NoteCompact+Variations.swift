import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.Contentbeforefixed> {
    
    var contentBeforeFixed: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.Contentbeforefixed> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.contentBeforeArrangement = NoteCompactContentBeforeArrangement.top
        size.contentBeforeEndMargin = CGFloat(8.0)
        size.iconSize = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "contentBeforeFixed",
            appearance: appearance
        )
    }
    
    var hasClose: ComponentAppearanceVariation<NoteCompact, NoteCompactAppearance> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.actionEndMargin = CGFloat(14.0)
        size.closeSize = CGFloat(24.0)
        size.closeStartMargin = CGFloat(2.0)
        size.paddingEnd = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "contentBeforeFixed.hasClose",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.ContentbeforefixedHasclose> {
    
    var hasClose: ComponentAppearanceVariation<NoteCompact, NoteCompactAppearance> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.actionEndMargin = CGFloat(14.0)
        size.closeSize = CGFloat(24.0)
        size.closeStartMargin = CGFloat(2.0)
        size.paddingEnd = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "contentBeforeFixed.hasClose",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.Contentbeforescalable> {
    
    var contentBeforeScalable: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.Contentbeforescalable> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.contentBeforeArrangement = NoteCompactContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(12.0)
        size.iconSize = CGFloat(0.0)
        size.paddingEnd = CGFloat(20.0)
        size.paddingStart = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "contentBeforeScalable",
            appearance: appearance
        )
    }
    
    var hasClose: ComponentAppearanceVariation<NoteCompact, NoteCompactAppearance> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.actionEndMargin = CGFloat(14.0)
        size.contentBeforeArrangement = NoteCompactContentBeforeArrangement.center
        size.closeSize = CGFloat(24.0)
        size.closeStartMargin = CGFloat(2.0)
        size.paddingEnd = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "contentBeforeScalable.hasClose",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.ContentbeforescalableHasclose> {
    
    var hasClose: ComponentAppearanceVariation<NoteCompact, NoteCompactAppearance> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.actionEndMargin = CGFloat(14.0)
        size.contentBeforeArrangement = NoteCompactContentBeforeArrangement.center
        size.closeSize = CGFloat(24.0)
        size.closeStartMargin = CGFloat(2.0)
        size.paddingEnd = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "contentBeforeScalable.hasClose",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
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


public extension ComponentAppearanceVariation<NoteCompact, NoteCompactAppearance> {
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
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

private extension NoteCompactAppearance {
    
    var `default`: NoteCompactAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        return appearance
    }
    
    var info: NoteCompactAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultInfoMinor
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.s.info.appearance
        return appearance
    }
    
    var negative: NoteCompactAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultNegativeMinor
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.s.negative.appearance
        return appearance
    }
    
    var positive: NoteCompactAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultPositiveMinor
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        return appearance
    }
    
    var warning: NoteCompactAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultWarningMinor
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.s.warning.appearance
        return appearance
    }
    
}
