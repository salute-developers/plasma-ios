import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.L> {
    
    var pilled: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2
        size.paddings = EdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
        size.width = CGFloat(86.0)

        var appearance = appearance
        appearance.size = size
        appearance.counterAppearance = 
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.M> {
    
    var pilled: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2
        size.paddings = EdgeInsets(top: 0.0, leading: 12.0, bottom: 0.0, trailing: 12.0)
        size.width = CGFloat(72.0)

        var appearance = appearance
        appearance.size = size
        appearance.counterAppearance = 
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.S> {
    
    var pilled: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2
        size.paddings = EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
        size.width = CGFloat(59.0)

        var appearance = appearance
        appearance.size = size
        appearance.counterAppearance = 
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.Xl> {
    
    var pilled: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2
        size.paddings = EdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        size.width = CGFloat(94.0)

        var appearance = appearance
        appearance.size = size
        appearance.counterAppearance = 
    
        return .init(
            name: "xl.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<SegmentItem, SegmentItemAppearance, SegmentItemVariation.Xs> {
    
    var pilled: ComponentAppearanceVariation<SegmentItem, SegmentItemAppearance> {
        var size =  SegmentItemAnySize(size: appearance.size)
        size.cornerRadius = size.height / 2
        size.paddings = EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
        size.width = CGFloat(53.0)

        var appearance = appearance
        appearance.size = size
        appearance.counterAppearance = 
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
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
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover)
        appearance.counterAppearance = 
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover)
        return appearance
    }
    
    var primary: SegmentItemAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover)
        appearance.counterAppearance = 
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover)
        return appearance
    }
    
    var secondary: SegmentItemAppearance {
        var appearance = self
        appearance.backgroundColor = ButtonColor(defaultColor: ColorToken.surfaceDefaultClear, highlightedColor: ColorToken.surfaceDefaultClear, hoveredColor: ColorToken.surfaceDefaultClearHover)
        appearance.counterAppearance = 
        appearance.endContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover)
        appearance.startContentColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimaryActive, hoveredColor: ColorToken.textDefaultPrimaryHover)
        appearance.subtitleColor = ButtonColor(defaultColor: ColorToken.textDefaultSecondary, highlightedColor: ColorToken.textDefaultSecondary, hoveredColor: ColorToken.textDefaultSecondaryHover)
        appearance.titleColor = ButtonColor(defaultColor: ColorToken.textDefaultPrimary, highlightedColor: ColorToken.textDefaultPrimary, hoveredColor: ColorToken.textDefaultPrimaryHover)
        return appearance
    }
    
}
