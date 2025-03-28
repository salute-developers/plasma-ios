import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


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
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultAccent)
        appearance.counterAppearance = Counter.s.accent.appearance.modify(.init(textTypography: Counter.s.accent.appearance.textTypography,textColor: ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimary, hoveredColor: ColorToken.textOnDarkPrimary, selectedColor: ColorToken.textOnLightPrimary),backgroundColor: ButtonColor(defaultColor: ColorToken.surfaceDefaultAccent, highlightedColor: ColorToken.surfaceDefaultAccent, hoveredColor: ColorToken.surfaceDefaultAccent, selectedColor: ColorToken.surfaceOnDarkSolidDefault)))
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textOnDarkSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultSolidDefault)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textInverseSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultTransparentCard)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textDefaultSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        
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
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultAccent)
        appearance.counterAppearance = Counter.s.accent.appearance.modify(.init(textTypography: Counter.s.accent.appearance.textTypography,textColor: ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimary, hoveredColor: ColorToken.textOnDarkPrimary, selectedColor: ColorToken.textOnLightPrimary),backgroundColor: ButtonColor(defaultColor: ColorToken.surfaceDefaultAccent, highlightedColor: ColorToken.surfaceDefaultAccent, hoveredColor: ColorToken.surfaceDefaultAccent, selectedColor: ColorToken.surfaceOnDarkSolidDefault)))
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textOnDarkSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultSolidDefault)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textInverseSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultTransparentCard)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textDefaultSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        
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
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultAccent)
        appearance.counterAppearance = Counter.xs.accent.appearance.modify(.init(textTypography: Counter.xs.accent.appearance.textTypography,textColor: ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimary, hoveredColor: ColorToken.textOnDarkPrimary, selectedColor: ColorToken.textOnLightPrimary),backgroundColor: ButtonColor(defaultColor: ColorToken.surfaceDefaultAccent, highlightedColor: ColorToken.surfaceDefaultAccent, hoveredColor: ColorToken.surfaceDefaultAccent, selectedColor: ColorToken.surfaceOnDarkSolidDefault)))
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textOnDarkSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultSolidDefault)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textInverseSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultTransparentCard)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textDefaultSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        
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
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultAccent)
        appearance.counterAppearance = Counter.xs.accent.appearance.modify(.init(textTypography: Counter.xs.accent.appearance.textTypography,textColor: ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimary, hoveredColor: ColorToken.textOnDarkPrimary, selectedColor: ColorToken.textOnLightPrimary),backgroundColor: ButtonColor(defaultColor: ColorToken.surfaceDefaultAccent, highlightedColor: ColorToken.surfaceDefaultAccent, hoveredColor: ColorToken.surfaceDefaultAccent, selectedColor: ColorToken.surfaceOnDarkSolidDefault)))
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textOnDarkSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultSolidDefault)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textInverseSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultTransparentCard)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textDefaultSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        
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
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultAccent)
        appearance.counterAppearance = Counter.xs.accent.appearance.modify(.init(textTypography: Counter.xs.accent.appearance.textTypography,textColor: ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimary, hoveredColor: ColorToken.textOnDarkPrimary, selectedColor: ColorToken.textOnLightPrimary),backgroundColor: ButtonColor(defaultColor: ColorToken.surfaceDefaultAccent, highlightedColor: ColorToken.surfaceDefaultAccent, hoveredColor: ColorToken.surfaceDefaultAccent, selectedColor: ColorToken.surfaceOnDarkSolidDefault)))
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textOnDarkSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultSolidDefault)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textInverseSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultTransparentCard)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textDefaultSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        
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
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultAccent)
        appearance.counterAppearance = Counter.xs.accent.appearance.modify(.init(textTypography: Counter.xs.accent.appearance.textTypography,textColor: ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimary, hoveredColor: ColorToken.textOnDarkPrimary, selectedColor: ColorToken.textOnLightPrimary),backgroundColor: ButtonColor(defaultColor: ColorToken.surfaceDefaultAccent, highlightedColor: ColorToken.surfaceDefaultAccent, hoveredColor: ColorToken.surfaceDefaultAccent, selectedColor: ColorToken.surfaceOnDarkSolidDefault)))
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textOnDarkSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultSolidDefault)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textInverseSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultTransparentCard)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textDefaultSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        
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
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultAccent)
        appearance.counterAppearance = Counter.s.accent.appearance.modify(.init(textTypography: Counter.s.accent.appearance.textTypography,textColor: ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimary, hoveredColor: ColorToken.textOnDarkPrimary, selectedColor: ColorToken.textOnLightPrimary),backgroundColor: ButtonColor(defaultColor: ColorToken.surfaceDefaultAccent, highlightedColor: ColorToken.surfaceDefaultAccent, hoveredColor: ColorToken.surfaceDefaultAccent, selectedColor: ColorToken.surfaceOnDarkSolidDefault)))
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textOnDarkSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultSolidDefault)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textInverseSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultTransparentCard)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textDefaultSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        
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
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultAccent)
        appearance.counterAppearance = Counter.s.accent.appearance.modify(.init(textTypography: Counter.s.accent.appearance.textTypography,textColor: ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimary, hoveredColor: ColorToken.textOnDarkPrimary, selectedColor: ColorToken.textOnLightPrimary),backgroundColor: ButtonColor(defaultColor: ColorToken.surfaceDefaultAccent, highlightedColor: ColorToken.surfaceDefaultAccent, hoveredColor: ColorToken.surfaceDefaultAccent, selectedColor: ColorToken.surfaceOnDarkSolidDefault)))
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textOnDarkSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultSolidDefault)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textInverseSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultTransparentCard)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textDefaultSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        
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
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultAccent)
        appearance.counterAppearance = Counter.xxs.accent.appearance.modify(.init(textTypography: Counter.xxs.accent.appearance.textTypography,textColor: ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimary, hoveredColor: ColorToken.textOnDarkPrimary, selectedColor: ColorToken.textOnLightPrimary),backgroundColor: ButtonColor(defaultColor: ColorToken.surfaceDefaultAccent, highlightedColor: ColorToken.surfaceDefaultAccent, hoveredColor: ColorToken.surfaceDefaultAccent, selectedColor: ColorToken.surfaceOnDarkSolidDefault)))
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textOnDarkSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultSolidDefault)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textInverseSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultTransparentCard)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textDefaultSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        
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
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultAccent)
        appearance.counterAppearance = Counter.xxs.accent.appearance.modify(.init(textTypography: Counter.xxs.accent.appearance.textTypography,textColor: ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimary, hoveredColor: ColorToken.textOnDarkPrimary, selectedColor: ColorToken.textOnLightPrimary),backgroundColor: ButtonColor(defaultColor: ColorToken.surfaceDefaultAccent, highlightedColor: ColorToken.surfaceDefaultAccent, hoveredColor: ColorToken.surfaceDefaultAccent, selectedColor: ColorToken.surfaceOnDarkSolidDefault)))
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textOnDarkSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultSolidDefault)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textInverseSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentItemAppearance> {
        var appearance = appearance
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultTransparentCard)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textDefaultSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        
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
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultAccent)
        appearance.counterAppearance = Counter.xxs.accent.appearance.modify(.init(textTypography: Counter.xxs.accent.appearance.textTypography,textColor: ButtonColor(defaultColor: ColorToken.textOnDarkPrimary, highlightedColor: ColorToken.textOnDarkPrimary, hoveredColor: ColorToken.textOnDarkPrimary, selectedColor: ColorToken.textOnLightPrimary),backgroundColor: ButtonColor(defaultColor: ColorToken.surfaceDefaultAccent, highlightedColor: ColorToken.surfaceDefaultAccent, hoveredColor: ColorToken.surfaceDefaultAccent, selectedColor: ColorToken.surfaceOnDarkSolidDefault)))
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textOnDarkSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textOnDarkPrimary)
        return appearance
    }
    
    var primary: SegmentItemAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultSolidDefault)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textInverseSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textInversePrimary)
        return appearance
    }
    
    var secondary: SegmentItemAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover, selectedColor: ColorToken.surfaceDefaultTransparentCard)
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover, selectedColor: ColorToken.textDefaultSecondary)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover, selectedColor: ColorToken.textDefaultPrimary)
        return appearance
    }
    
}
