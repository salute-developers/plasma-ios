import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.L> {
    
    var l: GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.L> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = ShapeToken.roundL.cornerRadius-2.0
        size.counterPadding = CGFloat(6.0)
        size.endContentSize = CGSize(width:24.0, height:24.0)
        size.height = CGFloat(56.0)
        size.iconHorizontalGap = CGFloat(6.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 24.0, bottom: 0.0, trailing: 24.0)
        size.startContentSize = CGSize(width:24.0, height:24.0)
        size.titleHorizontalGap = CGFloat(6.0)
        size.width = CGFloat(102.0)

        var appearance = appearance
        appearance.size = size
        appearance.counterAppearance = Counter.s.accent.appearance
        appearance.subtitleTypography = SegmentItemTypography(l: AdaptiveTypographyToken.bodyLBold.typography).asContainer
        appearance.titleTypography = SegmentItemTypography(l: AdaptiveTypographyToken.bodyLBold.typography).asContainer
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2
        size.paddings = EdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
        size.width = CGFloat(86.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var primary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "primary",
            appearance: appearance.primary
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.LPilled> {
    
    var pilled: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2
        size.paddings = EdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
        size.width = CGFloat(86.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var primary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "primary",
            appearance: appearance.primary
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.M> {
    
    var m: GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.M> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = ShapeToken.roundM.cornerRadius
        size.counterPadding = CGFloat(4.0)
        size.endContentSize = CGSize(width:24.0, height:24.0)
        size.height = CGFloat(48.0)
        size.iconHorizontalGap = CGFloat(4.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        size.startContentSize = CGSize(width:24.0, height:24.0)
        size.titleHorizontalGap = CGFloat(4.0)
        size.width = CGFloat(88.0)

        var appearance = appearance
        appearance.size = size
        appearance.counterAppearance = Counter.xs.accent.appearance
        appearance.subtitleTypography = SegmentItemTypography(m: AdaptiveTypographyToken.bodyMBold.typography).asContainer
        appearance.titleTypography = SegmentItemTypography(m: AdaptiveTypographyToken.bodyMBold.typography).asContainer
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2
        size.paddings = EdgeInsets(top: 0.0, leading: 12.0, bottom: 0.0, trailing: 12.0)
        size.width = CGFloat(72.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var primary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "primary",
            appearance: appearance.primary
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.MPilled> {
    
    var pilled: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2
        size.paddings = EdgeInsets(top: 0.0, leading: 12.0, bottom: 0.0, trailing: 12.0)
        size.width = CGFloat(72.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var primary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "primary",
            appearance: appearance.primary
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.S> {
    
    var pilled: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2
        size.paddings = EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
        size.width = CGFloat(59.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.S> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = ShapeToken.roundM.cornerRadius-2.0
        size.counterPadding = CGFloat(2.0)
        size.endContentSize = CGSize(width:24.0, height:24.0)
        size.height = CGFloat(40.0)
        size.iconHorizontalGap = CGFloat(2.0)
        size.iconSize = CGSize(width:24.0, height:24.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
        size.startContentSize = CGSize(width:24.0, height:24.0)
        size.titleHorizontalGap = CGFloat(2.0)
        size.width = CGFloat(75.0)

        var appearance = appearance
        appearance.size = size
        appearance.counterAppearance = Counter.xs.accent.appearance
        appearance.subtitleTypography = SegmentItemTypography(s: AdaptiveTypographyToken.bodySBold.typography).asContainer
        appearance.titleTypography = SegmentItemTypography(s: AdaptiveTypographyToken.bodySBold.typography).asContainer
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var primary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "primary",
            appearance: appearance.primary
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.SPilled> {
    
    var pilled: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2
        size.paddings = EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
        size.width = CGFloat(59.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var primary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "primary",
            appearance: appearance.primary
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.Xs> {
    
    var pilled: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2
        size.paddings = EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
        size.width = CGFloat(53.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.Xs> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = ShapeToken.roundS.cornerRadius
        size.counterPadding = CGFloat(2.0)
        size.endContentSize = CGSize(width:16.0, height:16.0)
        size.height = CGFloat(32.0)
        size.iconHorizontalGap = CGFloat(2.0)
        size.iconSize = CGSize(width:16.0, height:16.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 12.0, bottom: 0.0, trailing: 12.0)
        size.startContentSize = CGSize(width:16.0, height:16.0)
        size.titleHorizontalGap = CGFloat(2.0)
        size.width = CGFloat(61.0)

        var appearance = appearance
        appearance.size = size
        appearance.counterAppearance = Counter.xxs.accent.appearance
        appearance.subtitleTypography = SegmentItemTypography(xs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
        appearance.titleTypography = SegmentItemTypography(xs: AdaptiveTypographyToken.bodyXsBold.typography).asContainer
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    var primary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "primary",
            appearance: appearance.primary
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.XsPilled> {
    
    var pilled: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2
        size.paddings = EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
        size.width = CGFloat(53.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
    var primary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "primary",
            appearance: appearance.primary
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
    var primary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "primary",
            appearance: appearance.primary
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "secondary",
            appearance: appearance.secondary
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension SegmentItemAppearance {
    
    var primary: SegmentItemAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultClear, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultClearHover),
            .init(states: [InteractiveState.selected], value: ColorToken.surfaceDefaultSolidDefault),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.surfaceDefaultSolidDefaultActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.surfaceDefaultSolidDefaultHover)
        ]))
        appearance.endContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textInversePrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textInversePrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textInversePrimaryHover)
        ]))
        appearance.startContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textInversePrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textInversePrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textInversePrimaryHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textInverseSecondary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textInverseSecondaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textInverseSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textInversePrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textInversePrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textInversePrimaryHover)
        ]))
        return appearance
    }
    
    var secondary: SegmentItemAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultClear, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultClearHover),
            .init(states: [InteractiveState.selected], value: ColorToken.surfaceDefaultTransparentCard),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.surfaceDefaultTransparentCardActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.surfaceDefaultTransparentCardHover)
        ]))
        appearance.endContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textDefaultPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover)
        ]))
        appearance.startContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.pressed], value: ColorToken.textDefaultPrimaryActive),
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textDefaultPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textDefaultSecondary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textDefaultSecondaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textDefaultPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textDefaultPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover)
        ]))
        return appearance
    }
    
}

