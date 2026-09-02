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
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultAccent)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultAccentHover))
        ])
        appearance.counterAppearance = SegmentItemCounter.s.accent.appearance
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultSolidDefault)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInverseSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInverseSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInverseSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultTransparentCard)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultTransparentCardActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultTransparentCardHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        
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
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultAccent)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultAccentHover))
        ])
        appearance.counterAppearance = SegmentItemCounter.s.accent.appearance
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultSolidDefault)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInverseSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInverseSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInverseSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultTransparentCard)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultTransparentCardActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultTransparentCardHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        
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
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultAccent)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultAccentHover))
        ])
        appearance.counterAppearance = SegmentItemCounter.xs.accent.appearance
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultSolidDefault)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInverseSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInverseSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInverseSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultTransparentCard)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultTransparentCardActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultTransparentCardHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        
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
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultAccent)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultAccentHover))
        ])
        appearance.counterAppearance = SegmentItemCounter.xs.accent.appearance
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultSolidDefault)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInverseSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInverseSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInverseSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultTransparentCard)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultTransparentCardActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultTransparentCardHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        
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
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultAccent)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultAccentHover))
        ])
        appearance.counterAppearance = SegmentItemCounter.xs.accent.appearance
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultSolidDefault)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInverseSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInverseSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInverseSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultTransparentCard)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultTransparentCardActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultTransparentCardHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        
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
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultAccent)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultAccentHover))
        ])
        appearance.counterAppearance = SegmentItemCounter.xs.accent.appearance
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultSolidDefault)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInverseSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInverseSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInverseSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultTransparentCard)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultTransparentCardActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultTransparentCardHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        
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
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultAccent)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultAccentHover))
        ])
        appearance.counterAppearance = SegmentItemCounter.s.accent.appearance
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultSolidDefault)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInverseSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInverseSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInverseSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultTransparentCard)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultTransparentCardActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultTransparentCardHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        
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
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultAccent)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultAccentHover))
        ])
        appearance.counterAppearance = SegmentItemCounter.s.accent.appearance
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultSolidDefault)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInverseSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInverseSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInverseSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultTransparentCard)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultTransparentCardActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultTransparentCardHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        
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
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultAccent)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultAccentHover))
        ])
        appearance.counterAppearance = SegmentItemCounter.xxs.accent.appearance
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultSolidDefault)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInverseSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInverseSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInverseSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultTransparentCard)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultTransparentCardActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultTransparentCardHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        
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
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultAccent)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultAccentHover))
        ])
        appearance.counterAppearance = SegmentItemCounter.xxs.accent.appearance
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultSolidDefault)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInverseSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInverseSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInverseSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultTransparentCard)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultTransparentCardActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultTransparentCardHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        
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
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultAccent)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultAccentHover))
        ])
        appearance.counterAppearance = SegmentItemCounter.xxs.accent.appearance
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnDarkPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
    var primary: SegmentItemAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultSolidDefault)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultSolidDefaultActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultSolidDefaultHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInverseSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInverseSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInverseSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textInversePrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textInversePrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textInversePrimaryHover))
        ])
        return appearance
    }
    
    var secondary: SegmentItemAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultClear), values: [
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultClearHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceDefaultTransparentCard)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.surfaceDefaultTransparentCardActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.surfaceDefaultTransparentCardHover))
        ])
        appearance.endContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.startContentColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        appearance.subtitleColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultSecondaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultSecondary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultSecondaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultSecondaryHover))
        ])
        appearance.titleColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.hovered], value: .color(.textDefaultPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textDefaultPrimary)),
            .init(states: [InteractiveState.selected, InteractiveState.pressed], value: .color(.textDefaultPrimaryActive)),
            .init(states: [InteractiveState.selected, InteractiveState.hovered], value: .color(.textDefaultPrimaryHover))
        ])
        return appearance
    }
    
}

