import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Editable, EditableAppearance, EditableVariation.Bodyl> {
    
    var bodyL: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var size =  EditableAnySize(size: appearance.size)
        size.iconMargin = CGFloat(6.0)
        size.iconSize = CGFloat(22.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = EditableTypography(bodyL: AdaptiveTypographyToken.bodyLBold.typography).asContainer
    
        return .init(
            name: "bodyL",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Editable, EditableAppearance, EditableVariation.Bodym> {
    
    var bodyM: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var size =  EditableAnySize(size: appearance.size)
        size.iconMargin = CGFloat(6.0)
        size.iconSize = CGFloat(20.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = EditableTypography(bodyM: AdaptiveTypographyToken.bodyMBold.typography).asContainer
    
        return .init(
            name: "bodyM",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Editable, EditableAppearance, EditableVariation.Bodys> {
    
    var bodyS: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var size =  EditableAnySize(size: appearance.size)
        size.iconMargin = CGFloat(2.0)
        size.iconSize = CGFloat(18.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = EditableTypography(bodyS: AdaptiveTypographyToken.bodySBold.typography).asContainer
    
        return .init(
            name: "bodyS",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Editable, EditableAppearance, EditableVariation.Bodyxs> {
    
    var bodyXs: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var size =  EditableAnySize(size: appearance.size)
        size.iconMargin = CGFloat(2.0)
        size.iconSize = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = EditableTypography(bodyXs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
    
        return .init(
            name: "bodyXs",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Editable, EditableAppearance, EditableVariation.Bodyxxs> {
    
    var bodyXxs: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var size =  EditableAnySize(size: appearance.size)
        size.iconMargin = CGFloat(2.0)
        size.iconSize = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = EditableTypography(bodyXxs: AdaptiveTypographyToken.bodyXxsBold.typography).asContainer
    
        return .init(
            name: "bodyXxs",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Editable, EditableAppearance, EditableVariation.H1> {
    
    var h1: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var size =  EditableAnySize(size: appearance.size)
        size.iconMargin = CGFloat(8.0)
        size.iconSize = CGFloat(52.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = EditableTypography(h1: AdaptiveTypographyToken.headerH1Bold.typography).asContainer
    
        return .init(
            name: "h1",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Editable, EditableAppearance, EditableVariation.H2> {
    
    var h2: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var size =  EditableAnySize(size: appearance.size)
        size.iconMargin = CGFloat(8.0)
        size.iconSize = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = EditableTypography(h2: AdaptiveTypographyToken.headerH2Bold.typography).asContainer
    
        return .init(
            name: "h2",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Editable, EditableAppearance, EditableVariation.H3> {
    
    var h3: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var size =  EditableAnySize(size: appearance.size)
        size.iconMargin = CGFloat(6.0)
        size.iconSize = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = EditableTypography(h3: AdaptiveTypographyToken.headerH3Bold.typography).asContainer
    
        return .init(
            name: "h3",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Editable, EditableAppearance, EditableVariation.H4> {
    
    var h4: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var size =  EditableAnySize(size: appearance.size)
        size.iconMargin = CGFloat(6.0)
        size.iconSize = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = EditableTypography(h4: AdaptiveTypographyToken.headerH4Bold.typography).asContainer
    
        return .init(
            name: "h4",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Editable, EditableAppearance, EditableVariation.H5> {
    
    var h5: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var size =  EditableAnySize(size: appearance.size)
        size.iconMargin = CGFloat(6.0)
        size.iconSize = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = EditableTypography(h5: AdaptiveTypographyToken.headerH5Bold.typography).asContainer
    
        return .init(
            name: "h5",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Editable, EditableAppearance, EditableVariation.H6> {
    
    var h6: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var size =  EditableAnySize(size: appearance.size)
        size.iconMargin = CGFloat(2.0)
        size.iconSize = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = EditableTypography(h6: AdaptiveTypographyToken.headerH6Bold.typography).asContainer
    
        return .init(
            name: "h6",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<Editable, EditableAppearance> {
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension EditableAppearance {
    
}
