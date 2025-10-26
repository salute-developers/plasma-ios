import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.L> {
    
    var contentScalable: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.LContentscalable> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.contentBeforeArrangement = NoteCompactContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(16.0)
        size.iconSize = CGFloat(0.0)
        size.paddingEnd = CGFloat(28.0)
        size.paddingStart = CGFloat(28.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.contentScalable",
            appearance: appearance
        )
    }
    
    var hasClose: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.LHasclose> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.actionEndMargin = CGFloat(16.0)
        size.closeSize = CGFloat(24.0)
        size.closeStartMargin = CGFloat(4.0)
        size.paddingEnd = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "l.hasClose",
            appearance: appearance
        )
    }
    
    var hasCloseContentScalable: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.LHasclosecontentscalable> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.actionEndMargin = CGFloat(16.0)
        size.closeSize = CGFloat(24.0)
        size.closeStartMargin = CGFloat(4.0)
        size.contentBeforeArrangement = NoteCompactContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(16.0)
        size.iconSize = CGFloat(0.0)
        size.paddingEnd = CGFloat(16.0)
        size.paddingStart = CGFloat(28.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "l.hasCloseContentScalable",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.l.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.l.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.l.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.LContentscalable> {
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.l.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.l.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.l.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.LHasclose> {
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.l.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.l.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.l.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.LHasclosecontentscalable> {
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.l.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.l.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.l.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.M> {
    
    var contentScalable: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.MContentscalable> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.contentBeforeArrangement = NoteCompactContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(12.0)
        size.iconSize = CGFloat(0.0)
        size.paddingEnd = CGFloat(20.0)
        size.paddingStart = CGFloat(20.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.contentScalable",
            appearance: appearance
        )
    }
    
    var hasClose: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.MHasclose> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.actionEndMargin = CGFloat(16.0)
        size.closeSize = CGFloat(24.0)
        size.closeStartMargin = CGFloat(4.0)
        size.paddingEnd = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "m.hasClose",
            appearance: appearance
        )
    }
    
    var hasCloseContentScalable: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.MHasclosecontentscalable> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.actionEndMargin = CGFloat(16.0)
        size.closeSize = CGFloat(24.0)
        size.closeStartMargin = CGFloat(4.0)
        size.contentBeforeArrangement = NoteCompactContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(12.0)
        size.iconSize = CGFloat(0.0)
        size.paddingEnd = CGFloat(12.0)
        size.paddingStart = CGFloat(20.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "m.hasCloseContentScalable",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.m.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.m.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.m.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.MContentscalable> {
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.m.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.m.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.m.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.MHasclose> {
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.m.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.m.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.m.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.MHasclosecontentscalable> {
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.m.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.m.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.m.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.S> {
    
    var contentScalable: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.SContentscalable> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.contentBeforeArrangement = NoteCompactContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(12.0)
        size.iconSize = CGFloat(0.0)
        size.paddingEnd = CGFloat(20.0)
        size.paddingStart = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.contentScalable",
            appearance: appearance
        )
    }
    
    var hasClose: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.SHasclose> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.actionEndMargin = CGFloat(12.0)
        size.closeSize = CGFloat(24.0)
        size.closeStartMargin = CGFloat(2.0)
        size.paddingEnd = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "s.hasClose",
            appearance: appearance
        )
    }
    
    var hasCloseContentScalable: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.SHasclosecontentscalable> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.actionEndMargin = CGFloat(12.0)
        size.closeSize = CGFloat(24.0)
        size.closeStartMargin = CGFloat(2.0)
        size.contentBeforeArrangement = NoteCompactContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(12.0)
        size.iconSize = CGFloat(0.0)
        size.paddingEnd = CGFloat(10.0)
        size.paddingStart = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "s.hasCloseContentScalable",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.s.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.s.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.s.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.SContentscalable> {
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.s.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.s.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.s.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.SHasclose> {
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.s.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.s.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.s.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.SHasclosecontentscalable> {
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.s.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.s.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.s.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.Xs> {
    
    var contentScalable: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.XsContentscalable> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.contentBeforeArrangement = NoteCompactContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(8.0)
        size.iconSize = CGFloat(0.0)
        size.paddingEnd = CGFloat(16.0)
        size.paddingStart = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.contentScalable",
            appearance: appearance
        )
    }
    
    var hasClose: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.XsHasclose> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.actionEndMargin = CGFloat(12.0)
        size.closeSize = CGFloat(16.0)
        size.closeStartMargin = CGFloat(2.0)
        size.paddingEnd = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close16.image
    
        return .init(
            name: "xs.hasClose",
            appearance: appearance
        )
    }
    
    var hasCloseContentScalable: GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.XsHasclosecontentscalable> {
        var size =  NoteCompactAnySize(size: appearance.size)
        size.actionEndMargin = CGFloat(12.0)
        size.closeSize = CGFloat(16.0)
        size.closeStartMargin = CGFloat(2.0)
        size.contentBeforeArrangement = NoteCompactContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(8.0)
        size.iconSize = CGFloat(0.0)
        size.paddingEnd = CGFloat(10.0)
        size.paddingStart = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close16.image
    
        return .init(
            name: "xs.hasCloseContentScalable",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.xs.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.xs.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.xs.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.XsContentscalable> {
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.xs.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.xs.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.xs.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.XsHasclose> {
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.xs.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.xs.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.xs.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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

public extension GeneralAppearanceVariation<NoteCompact, NoteCompactAppearance, NoteCompactVariation.XsHasclosecontentscalable> {
    
    var `default`: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.xs.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.xs.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteCompactAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.xs.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteCompactAppearance> {
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
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        return appearance
    }
    
    var info: NoteCompactAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.xs.info.appearance
        return appearance
    }
    
    var negative: NoteCompactAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.xs.negative.appearance
        return appearance
    }
    
    var positive: NoteCompactAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        return appearance
    }
    
    var warning: NoteCompactAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.xs.warning.appearance
        return appearance
    }
    
}
