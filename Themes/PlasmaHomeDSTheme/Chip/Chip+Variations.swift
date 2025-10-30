import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.L> {
    
    var l: GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.L> {
        var size =  ChipAnySize(size: appearance.size)
        size.buttonImageSize = CGSize(width:24.0, height:24.0)
        size.contentEndPadding = CGFloat(8.0)
        size.contentStartPadding = CGFloat(8.0)
        size.cornerRadius = ShapeToken.roundM.cornerRadius
        size.height = CGFloat(48.0)
        size.iconImageSize = CGSize(width:24.0, height:24.0)
        size.leadingInset = CGFloat(16.0)
        size.trailingInset = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = ChipTypography(l: AdaptiveTypographyToken.bodyLNormal.typography).asContainer
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.LPilled> {
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.M> {
    
    var m: GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.M> {
        var size =  ChipAnySize(size: appearance.size)
        size.buttonImageSize = CGSize(width:24.0, height:24.0)
        size.contentEndPadding = CGFloat(6.0)
        size.contentStartPadding = CGFloat(6.0)
        size.cornerRadius = ShapeToken.roundM.cornerRadius-2.0
        size.height = CGFloat(40.0)
        size.iconImageSize = CGSize(width:24.0, height:24.0)
        size.leadingInset = CGFloat(14.0)
        size.trailingInset = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = ChipTypography(m: AdaptiveTypographyToken.bodyMNormal.typography).asContainer
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.MPilled> {
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.S> {
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.S> {
        var size =  ChipAnySize(size: appearance.size)
        size.buttonImageSize = CGSize(width:16.0, height:16.0)
        size.contentEndPadding = CGFloat(4.0)
        size.contentStartPadding = CGFloat(4.0)
        size.cornerRadius = ShapeToken.roundS.cornerRadius
        size.height = CGFloat(32.0)
        size.iconImageSize = CGSize(width:16.0, height:16.0)
        size.leadingInset = CGFloat(12.0)
        size.trailingInset = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = ChipTypography(s: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.SPilled> {
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.Xs> {
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.Xs> {
        var size =  ChipAnySize(size: appearance.size)
        size.buttonImageSize = CGSize(width:12.0, height:12.0)
        size.contentEndPadding = CGFloat(4.0)
        size.contentStartPadding = CGFloat(4.0)
        size.cornerRadius = ShapeToken.roundXs.cornerRadius
        size.height = CGFloat(24.0)
        size.iconImageSize = CGSize(width:12.0, height:12.0)
        size.leadingInset = CGFloat(10.0)
        size.trailingInset = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = ChipTypography(xs: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.XsPilled> {
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.Xxs> {
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs.pilled",
            appearance: appearance
        )
    }
    
    var xxs: GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.Xxs> {
        var size =  ChipAnySize(size: appearance.size)
        size.buttonImageSize = CGSize(width:12.0, height:12.0)
        size.contentEndPadding = CGFloat(2.0)
        size.contentStartPadding = CGFloat(2.0)
        size.cornerRadius = ShapeToken.roundXs.cornerRadius
        size.height = CGFloat(20.0)
        size.iconImageSize = CGSize(width:12.0, height:12.0)
        size.leadingInset = CGFloat(8.0)
        size.trailingInset = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.titleTypography = ChipTypography(xxs: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer
    
        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Chip, ChipAppearance, ChipVariation.XxsPilled> {
    
    var pilled: ComponentAppearanceVariation<Chip, ChipAppearance> {
        var size =  ChipAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<Chip, ChipAppearance> {
    var `default`: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var secondary: AppearanceVariation<ChipAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension ChipAppearance {
    
    var `default`: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultSolidDefault, highlightedColor: ColorToken.surfaceDefaultSolidDefaultActive, hoveredColor: ColorToken.surfaceDefaultSolidDefaultHover, selectedColor: .clearColor)
        appearance.buttonTintColor = ButtonColor(defaultColor: ColorToken.textInverseSecondary, highlightedColor: ColorToken.textInverseSecondaryActive, hoveredColor: ColorToken.textInverseSecondaryHover, selectedColor: .clearColor)
        appearance.imageTintColor = ButtonColor(defaultColor: ColorToken.textInversePrimary, highlightedColor: ColorToken.textInversePrimaryActive, hoveredColor: ColorToken.textInversePrimaryHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textInversePrimary, highlightedColor: ColorToken.textInversePrimaryActive, hoveredColor: ColorToken.textInversePrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
    var secondary: ChipAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultTransparentSecondary, highlightedColor: ColorToken.surfaceDefaultTransparentSecondaryActive, hoveredColor: ColorToken.surfaceDefaultTransparentSecondaryHover, selectedColor: .clearColor)
        appearance.buttonTintColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondaryActive, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: .clearColor)
        appearance.imageTintColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: .clearColor)
        return appearance
    }
    
}
