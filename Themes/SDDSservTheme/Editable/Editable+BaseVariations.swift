import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Editable {
    public static var bodyL: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var appearance = EditableAppearance.base
        appearance.size = EditableSize.bodyL
        appearance.textTypography = EditableTypography(oneSize: AdaptiveTypographyToken.bodyLBold.typography).asContainer

        return .init(
            name: "bodyL",
            appearance: appearance
        )
    }
    public static var bodyM: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var appearance = EditableAppearance.base
        appearance.size = EditableSize.bodyM
        appearance.textTypography = EditableTypography(oneSize: AdaptiveTypographyToken.bodyMBold.typography).asContainer

        return .init(
            name: "bodyM",
            appearance: appearance
        )
    }
    public static var bodyS: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var appearance = EditableAppearance.base
        appearance.size = EditableSize.bodyS
        appearance.textTypography = EditableTypography(oneSize: AdaptiveTypographyToken.bodySBold.typography).asContainer

        return .init(
            name: "bodyS",
            appearance: appearance
        )
    }
    public static var bodyXs: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var appearance = EditableAppearance.base
        appearance.size = EditableSize.bodyXs
        appearance.textTypography = EditableTypography(oneSize: AdaptiveTypographyToken.bodyXsBold.typography).asContainer

        return .init(
            name: "bodyXs",
            appearance: appearance
        )
    }
    public static var bodyXxs: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var appearance = EditableAppearance.base
        appearance.size = EditableSize.bodyXxs
        appearance.textTypography = EditableTypography(oneSize: AdaptiveTypographyToken.bodyXxsBold.typography).asContainer

        return .init(
            name: "bodyXxs",
            appearance: appearance
        )
    }
    public static var h1: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var appearance = EditableAppearance.base
        appearance.size = EditableSize.h1
        appearance.textTypography = EditableTypography(oneSize: AdaptiveTypographyToken.headerH1Bold.typography).asContainer

        return .init(
            name: "h1",
            appearance: appearance
        )
    }
    public static var h2: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var appearance = EditableAppearance.base
        appearance.size = EditableSize.h2
        appearance.textTypography = EditableTypography(oneSize: AdaptiveTypographyToken.headerH2Bold.typography).asContainer

        return .init(
            name: "h2",
            appearance: appearance
        )
    }
    public static var h3: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var appearance = EditableAppearance.base
        appearance.size = EditableSize.h3
        appearance.textTypography = EditableTypography(oneSize: AdaptiveTypographyToken.headerH3Bold.typography).asContainer

        return .init(
            name: "h3",
            appearance: appearance
        )
    }
    public static var h4: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var appearance = EditableAppearance.base
        appearance.size = EditableSize.h4
        appearance.textTypography = EditableTypography(oneSize: AdaptiveTypographyToken.headerH4Bold.typography).asContainer

        return .init(
            name: "h4",
            appearance: appearance
        )
    }
    public static var h5: ComponentAppearanceVariation<Editable, EditableAppearance> {
        var appearance = EditableAppearance.base
        appearance.size = EditableSize.h5
        appearance.textTypography = EditableTypography(oneSize: AdaptiveTypographyToken.headerH5Bold.typography).asContainer

        return .init(
            name: "h5",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<EditableAppearance>] = [
        Editable.bodyL.variation,
        Editable.bodyM.variation,
        Editable.bodyS.variation,
        Editable.bodyXs.variation,
        Editable.bodyXxs.variation,
        Editable.h1.variation,
        Editable.h2.variation,
        Editable.h3.variation,
        Editable.h4.variation,
        Editable.h5.variation,
    ]
}

public struct EditableVariation {
    public struct Bodyl {}
    public struct Bodym {}
    public struct Bodys {}
    public struct Bodyxs {}
    public struct Bodyxxs {}
    public struct H1 {}
    public struct H2 {}
    public struct H3 {}
    public struct H4 {}
    public struct H5 {}
}

private extension EditableAppearance {
    static var base: EditableAppearance {
        var appearance = EditableAppearance()
        appearance.cursorColor = ColorToken.textDefaultAccent
        appearance.disabledAlpha = 0.4
        appearance.iconColorDefault = ColorToken.textDefaultTertiary
        appearance.iconColorReadonly = ColorToken.textDefaultSecondary
        appearance.textColorDefault = ColorToken.textDefaultPrimary
        appearance.textColorReadonly = ColorToken.textDefaultSecondary
        return appearance
    }
}
