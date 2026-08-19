import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<SegmentItemCounter, CounterAppearance, SegmentItemCounterVariation.L> {
    
    var l: ComponentAppearanceVariation<SegmentItemCounter, CounterAppearance> {
        var size =  SegmentItemCounterAnySize(size: appearance.size)
        size.height = CGFloat(28.0)
        size.paddings = EdgeInsets(top: 5.0, leading: 10.0, bottom: 5.0, trailing: 10.0)
        size.width = CGFloat(28.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = SegmentItemCounterTypography(l: AdaptiveTypographyToken.bodySNormal.typography).asContainer
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItemCounter, CounterAppearance, SegmentItemCounterVariation.M> {
    
    var m: ComponentAppearanceVariation<SegmentItemCounter, CounterAppearance> {
        var size =  SegmentItemCounterAnySize(size: appearance.size)
        size.height = CGFloat(24.0)
        size.paddings = EdgeInsets(top: 5.0, leading: 8.0, bottom: 5.0, trailing: 8.0)
        size.width = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = SegmentItemCounterTypography(m: AdaptiveTypographyToken.bodyXsNormal.typography).asContainer
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItemCounter, CounterAppearance, SegmentItemCounterVariation.S> {
    
    var s: ComponentAppearanceVariation<SegmentItemCounter, CounterAppearance> {
        var size =  SegmentItemCounterAnySize(size: appearance.size)
        size.height = CGFloat(20.0)
        size.paddings = EdgeInsets(top: 4.0, leading: 6.0, bottom: 4.0, trailing: 6.0)
        size.width = CGFloat(20.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = SegmentItemCounterTypography(s: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItemCounter, CounterAppearance, SegmentItemCounterVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<SegmentItemCounter, CounterAppearance> {
        var size =  SegmentItemCounterAnySize(size: appearance.size)
        size.height = CGFloat(16.0)
        size.paddings = EdgeInsets(top: 1.5, leading: 4.0, bottom: 2.5, trailing: 4.0)
        size.width = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = SegmentItemCounterTypography(xs: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<SegmentItemCounter, CounterAppearance, SegmentItemCounterVariation.Xxs> {
    
    var xxs: ComponentAppearanceVariation<SegmentItemCounter, CounterAppearance> {
        var size =  SegmentItemCounterAnySize(size: appearance.size)
        size.height = CGFloat(12.0)
        size.paddings = EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0)
        size.width = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.textTypography = SegmentItemCounterTypography(xxs: AdaptiveTypographyToken.bodyXxsNormal.typography).asContainer
    
        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<SegmentItemCounter, CounterAppearance> {
    var `default`: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var accent: AppearanceVariation<CounterAppearance> {
        return .init(
            name: "accent",
            appearance: appearance.accent
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension CounterAppearance {
    
    var `default`: CounterAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultAccent), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultAccentHover))
        ])
        appearance.textColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover))
        ])
        return appearance
    }
    
    var accent: CounterAppearance {
        var appearance = self
        appearance.backgroundColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultAccent), values: [
            .init(states: [InteractiveState.pressed], value: .color(.surfaceDefaultAccentActive)),
            .init(states: [InteractiveState.hovered], value: .color(.surfaceDefaultAccentHover)),
            .init(states: [InteractiveState.selected], value: .color(.surfaceOnDarkSolidDefault))
        ])
        appearance.textColor = StatefulFillStyle(defaultValue: .color(.textOnDarkPrimary), values: [
            .init(states: [InteractiveState.pressed], value: .color(.textOnDarkPrimaryActive)),
            .init(states: [InteractiveState.hovered], value: .color(.textOnDarkPrimaryHover)),
            .init(states: [InteractiveState.selected], value: .color(.textOnLightPrimary))
        ])
        return appearance
    }
    
}

