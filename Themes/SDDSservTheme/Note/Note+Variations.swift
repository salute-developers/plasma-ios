import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.L> {
    
    var contentScalable: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.LContentscalable> {
        var size =  NoteAnySize(size: appearance.size)
        size.contentBeforeArrangement = NoteContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(16.0)
        size.iconSize = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.contentScalable",
            appearance: appearance
        )
    }
    
    var hasClose: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.LHasclose> {
        var size =  NoteAnySize(size: appearance.size)
        size.closeEndMargin = CGFloat(16.0)
        size.closeSize = CGFloat(24.0)
        size.closeTopMargin = CGFloat(16.0)
        size.titlePaddingEnd = CGFloat(30.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "l.hasClose",
            appearance: appearance
        )
    }
    
    var hasCloseContentScalable: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.LHasclosecontentscalable> {
        var size =  NoteAnySize(size: appearance.size)
        size.closeEndMargin = CGFloat(16.0)
        size.closeSize = CGFloat(24.0)
        size.closeTopMargin = CGFloat(16.0)
        size.contentBeforeArrangement = NoteContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(16.0)
        size.iconSize = CGFloat(0.0)
        size.titlePaddingEnd = CGFloat(30.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "l.hasCloseContentScalable",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.l.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.l.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.l.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.LContentscalable> {
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.l.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.l.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.l.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.LHasclose> {
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.l.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.l.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.l.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.LHasclosecontentscalable> {
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.l.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.l.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.l.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.l.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.M> {
    
    var contentScalable: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.MContentscalable> {
        var size =  NoteAnySize(size: appearance.size)
        size.contentBeforeArrangement = NoteContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(12.0)
        size.iconSize = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.contentScalable",
            appearance: appearance
        )
    }
    
    var hasClose: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.MHasclose> {
        var size =  NoteAnySize(size: appearance.size)
        size.closeEndMargin = CGFloat(12.0)
        size.closeSize = CGFloat(24.0)
        size.closeTopMargin = CGFloat(12.0)
        size.titlePaddingEnd = CGFloat(28.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "m.hasClose",
            appearance: appearance
        )
    }
    
    var hasCloseContentScalable: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.MHasclosecontentscalable> {
        var size =  NoteAnySize(size: appearance.size)
        size.closeEndMargin = CGFloat(12.0)
        size.closeSize = CGFloat(24.0)
        size.closeTopMargin = CGFloat(12.0)
        size.contentBeforeArrangement = NoteContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(12.0)
        size.iconSize = CGFloat(0.0)
        size.titlePaddingEnd = CGFloat(28.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "m.hasCloseContentScalable",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.m.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.m.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.m.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.MContentscalable> {
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.m.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.m.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.m.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.MHasclose> {
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.m.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.m.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.m.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.MHasclosecontentscalable> {
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.m.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.m.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.m.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.m.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.S> {
    
    var contentScalable: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.SContentscalable> {
        var size =  NoteAnySize(size: appearance.size)
        size.contentBeforeArrangement = NoteContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(12.0)
        size.iconSize = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.contentScalable",
            appearance: appearance
        )
    }
    
    var hasClose: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.SHasclose> {
        var size =  NoteAnySize(size: appearance.size)
        size.closeEndMargin = CGFloat(10.0)
        size.closeSize = CGFloat(24.0)
        size.closeTopMargin = CGFloat(10.0)
        size.titlePaddingEnd = CGFloat(26.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "s.hasClose",
            appearance: appearance
        )
    }
    
    var hasCloseContentScalable: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.SHasclosecontentscalable> {
        var size =  NoteAnySize(size: appearance.size)
        size.closeEndMargin = CGFloat(10.0)
        size.closeSize = CGFloat(24.0)
        size.closeTopMargin = CGFloat(10.0)
        size.contentBeforeArrangement = NoteContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(12.0)
        size.iconSize = CGFloat(0.0)
        size.titlePaddingEnd = CGFloat(26.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close24.image
    
        return .init(
            name: "s.hasCloseContentScalable",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.s.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.s.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.s.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.SContentscalable> {
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.s.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.s.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.s.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.SHasclose> {
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.s.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.s.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.s.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.SHasclosecontentscalable> {
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.s.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.s.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.s.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.s.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.Xs> {
    
    var contentScalable: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.XsContentscalable> {
        var size =  NoteAnySize(size: appearance.size)
        size.contentBeforeArrangement = NoteContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(8.0)
        size.iconSize = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.contentScalable",
            appearance: appearance
        )
    }
    
    var hasClose: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.XsHasclose> {
        var size =  NoteAnySize(size: appearance.size)
        size.closeEndMargin = CGFloat(10.0)
        size.closeSize = CGFloat(16.0)
        size.closeTopMargin = CGFloat(10.0)
        size.titlePaddingEnd = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close16.image
    
        return .init(
            name: "xs.hasClose",
            appearance: appearance
        )
    }
    
    var hasCloseContentScalable: GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.XsHasclosecontentscalable> {
        var size =  NoteAnySize(size: appearance.size)
        size.closeEndMargin = CGFloat(10.0)
        size.closeSize = CGFloat(16.0)
        size.closeTopMargin = CGFloat(10.0)
        size.contentBeforeArrangement = NoteContentBeforeArrangement.center
        size.contentBeforeEndMargin = CGFloat(8.0)
        size.iconSize = CGFloat(0.0)
        size.titlePaddingEnd = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
        appearance.closeIcon = Asset.close16.image
    
        return .init(
            name: "xs.hasCloseContentScalable",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.xs.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.xs.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.xs.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.XsContentscalable> {
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.xs.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.xs.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.xs.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.XsHasclose> {
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.xs.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.xs.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.xs.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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

public extension GeneralAppearanceVariation<Note, NoteAppearance, NoteVariation.XsHasclosecontentscalable> {
    
    var `default`: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var info: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.xs.info.appearance
        
        return .init(
            name: "info",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.xs.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<NoteAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.xs.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<NoteAppearance> {
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
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentSecondary
        appearance.iconColor = ColorToken.textDefaultPrimary
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        return appearance
    }
    
    var info: NoteAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentInfo
        appearance.iconColor = ColorToken.textDefaultInfo
        appearance.linkButtonAppearance = LinkButton.xs.info.appearance
        return appearance
    }
    
    var negative: NoteAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentNegative
        appearance.iconColor = ColorToken.textDefaultNegative
        appearance.linkButtonAppearance = LinkButton.xs.negative.appearance
        return appearance
    }
    
    var positive: NoteAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentPositive
        appearance.iconColor = ColorToken.textDefaultPositive
        appearance.linkButtonAppearance = LinkButton.xs.positive.appearance
        return appearance
    }
    
    var warning: NoteAppearance {
        var appearance = self
        appearance.backgroundColor = ColorToken.surfaceDefaultTransparentWarning
        appearance.iconColor = ColorToken.textDefaultWarning
        appearance.linkButtonAppearance = LinkButton.xs.warning.appearance
        return appearance
    }
    
}
