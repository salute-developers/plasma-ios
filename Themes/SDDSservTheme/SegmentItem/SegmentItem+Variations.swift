import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.L> {
    
    var pilled: GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.LPilled> {
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
    
    var accent: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultClear, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultClearHover),
            .init(states: [InteractiveState.selected], value: ColorToken.surfaceDefaultAccent),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.surfaceDefaultAccentActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.surfaceDefaultAccentHover)
        ]))
        appearance.counterAppearance = SegmentItemCounter.s.accent.appearance
        appearance.endContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.startContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkSecondary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkSecondaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentItemAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.LPilled> {
    
    var accent: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultClear, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultClearHover),
            .init(states: [InteractiveState.selected], value: ColorToken.surfaceDefaultAccent),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.surfaceDefaultAccentActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.surfaceDefaultAccentHover)
        ]))
        appearance.counterAppearance = SegmentItemCounter.s.accent.appearance
        appearance.endContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.startContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkSecondary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkSecondaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentItemAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.M> {
    
    var pilled: GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.MPilled> {
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
    
    var accent: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultClear, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultClearHover),
            .init(states: [InteractiveState.selected], value: ColorToken.surfaceDefaultAccent),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.surfaceDefaultAccentActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.surfaceDefaultAccentHover)
        ]))
        appearance.counterAppearance = SegmentItemCounter.xs.accent.appearance
        appearance.endContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.startContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkSecondary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkSecondaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentItemAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.MPilled> {
    
    var accent: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultClear, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultClearHover),
            .init(states: [InteractiveState.selected], value: ColorToken.surfaceDefaultAccent),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.surfaceDefaultAccentActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.surfaceDefaultAccentHover)
        ]))
        appearance.counterAppearance = SegmentItemCounter.xs.accent.appearance
        appearance.endContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.startContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkSecondary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkSecondaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentItemAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.S> {
    
    var pilled: GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.SPilled> {
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
    
    var accent: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultClear, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultClearHover),
            .init(states: [InteractiveState.selected], value: ColorToken.surfaceDefaultAccent),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.surfaceDefaultAccentActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.surfaceDefaultAccentHover)
        ]))
        appearance.counterAppearance = SegmentItemCounter.xs.accent.appearance
        appearance.endContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.startContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkSecondary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkSecondaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentItemAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.SPilled> {
    
    var accent: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultClear, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultClearHover),
            .init(states: [InteractiveState.selected], value: ColorToken.surfaceDefaultAccent),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.surfaceDefaultAccentActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.surfaceDefaultAccentHover)
        ]))
        appearance.counterAppearance = SegmentItemCounter.xs.accent.appearance
        appearance.endContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.startContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkSecondary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkSecondaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentItemAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.Xl> {
    
    var pilled: GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.XlPilled> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2
        size.paddings = EdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        size.width = CGFloat(94.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xl.pilled",
            appearance: appearance
        )
    }
    
    var accent: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultClear, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultClearHover),
            .init(states: [InteractiveState.selected], value: ColorToken.surfaceDefaultAccent),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.surfaceDefaultAccentActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.surfaceDefaultAccentHover)
        ]))
        appearance.counterAppearance = SegmentItemCounter.s.accent.appearance
        appearance.endContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.startContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkSecondary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkSecondaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentItemAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.XlPilled> {
    
    var accent: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultClear, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultClearHover),
            .init(states: [InteractiveState.selected], value: ColorToken.surfaceDefaultAccent),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.surfaceDefaultAccentActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.surfaceDefaultAccentHover)
        ]))
        appearance.counterAppearance = SegmentItemCounter.s.accent.appearance
        appearance.endContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.startContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkSecondary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkSecondaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentItemAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.Xs> {
    
    var pilled: GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.XsPilled> {
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
    
    var accent: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultClear, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultClearHover),
            .init(states: [InteractiveState.selected], value: ColorToken.surfaceDefaultAccent),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.surfaceDefaultAccentActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.surfaceDefaultAccentHover)
        ]))
        appearance.counterAppearance = SegmentItemCounter.xxs.accent.appearance
        appearance.endContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.startContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkSecondary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkSecondaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentItemAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.XsPilled> {
    
    var accent: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultClear, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultClearHover),
            .init(states: [InteractiveState.selected], value: ColorToken.surfaceDefaultAccent),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.surfaceDefaultAccentActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.surfaceDefaultAccentHover)
        ]))
        appearance.counterAppearance = SegmentItemCounter.xxs.accent.appearance
        appearance.endContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.startContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkSecondary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkSecondaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
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
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentItemAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
    var accent: AppearanceVariation<SegmentItemAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
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
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension SegmentItemAppearance {
    
    var accent: SegmentItemAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(StatefulColor(defaultValue: ColorToken.surfaceDefaultClear, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.surfaceDefaultClearHover),
            .init(states: [InteractiveState.selected], value: ColorToken.surfaceDefaultAccent),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.surfaceDefaultAccentActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.surfaceDefaultAccentHover)
        ]))
        appearance.counterAppearance = SegmentItemCounter.xxs.accent.appearance
        appearance.endContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.startContentColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        appearance.subtitleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultSecondary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultSecondaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkSecondary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkSecondaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkSecondaryHover)
        ]))
        appearance.titleColor = ButtonColor(StatefulColor(defaultValue: ColorToken.textDefaultPrimary, values: [
            .init(states: [InteractiveState.hovered], value: ColorToken.textDefaultPrimaryHover),
            .init(states: [InteractiveState.selected], value: ColorToken.textOnDarkPrimary),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: ColorToken.textOnDarkPrimaryActive),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: ColorToken.textOnDarkPrimaryHover)
        ]))
        return appearance
    }
    
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

