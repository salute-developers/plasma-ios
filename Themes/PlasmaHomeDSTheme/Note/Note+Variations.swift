import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.Contentbeforefixed> {
    
    var contentBeforeFixed: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.Contentbeforefixed> {
        var size =  NoteAnySize(size: appearance.size)
        size.contentBeforeArrangement = NoteContentBeforeArrangement.top
        size.contentBeforeEndMargin = CGFloat(8.0)
        size.iconSize = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "contentBeforeFixed",
            appearance: appearance
        )
    }
    
    var hasClose: ComponentAppearanceVariation<Note, NoteAppearance> {
        var size =  NoteAnySize(size: appearance.size)
        size.closeEndMargin = CGFloat(10.0)
        size.closeSize = CGFloat(24.0)
        size.closeTopMargin = CGFloat(10.0)
        size.titlePaddingEnd = CGFloat(26.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "contentBeforeFixed.hasClose",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.ContentbeforefixedHasclose> {
    
    var hasClose: ComponentAppearanceVariation<Note, NoteAppearance> {
        var size =  NoteAnySize(size: appearance.size)
        size.closeEndMargin = CGFloat(10.0)
        size.closeSize = CGFloat(24.0)
        size.closeTopMargin = CGFloat(10.0)
        size.titlePaddingEnd = CGFloat(26.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "contentBeforeFixed.hasClose",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.Contentbeforescalable> {
    
    var contentBeforeScalable: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.Contentbeforescalable> {
        var size =  NoteAnySize(size: appearance.size)
        size.contentBeforeArrangement = NoteContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(12.0)
        size.iconSize = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "contentBeforeScalable",
            appearance: appearance
        )
    }
    
    var hasClose: ComponentAppearanceVariation<Note, NoteAppearance> {
        var size =  NoteAnySize(size: appearance.size)
        size.closeEndMargin = CGFloat(10.0)
        size.closeSize = CGFloat(24.0)
        size.closeTopMargin = CGFloat(10.0)
        size.titlePaddingEnd = CGFloat(26.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "contentBeforeScalable.hasClose",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.ContentbeforescalableHasclose> {
    
    var hasClose: ComponentAppearanceVariation<Note, NoteAppearance> {
        var size =  NoteAnySize(size: appearance.size)
        size.closeEndMargin = CGFloat(10.0)
        size.closeSize = CGFloat(24.0)
        size.closeTopMargin = CGFloat(10.0)
        size.titlePaddingEnd = CGFloat(26.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "contentBeforeScalable.hasClose",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
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


public extension ComponentAppearanceVariation<Note, NoteAppearance> {
    var `default`: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "info",
            appearance: appearance.info
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
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

private extension NoteAppearance {
    
    var `default`: NoteAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        return appearance
    }
    
    var info: NoteAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultInfoMinor
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.s.info.appearance
        return appearance
    }
    
    var negative: NoteAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultNegativeMinor
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.s.negative.appearance
        return appearance
    }
    
    var positive: NoteAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultPositiveMinor
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        return appearance
    }
    
    var warning: NoteAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultWarningMinor
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.s.warning.appearance
        return appearance
    }
    
}
