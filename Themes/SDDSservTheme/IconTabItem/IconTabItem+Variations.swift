import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<IconTabItem, TabItemAppearance, IconTabItemVariation.L> {
    
    var l: ComponentAppearanceVariation<IconTabItem, TabItemAppearance> {
        var size =  IconTabItemAnySize(size: appearance.size)
        size.actionIconSize = CGFloat(24)
        size.actionPadding = CGFloat(10.0)
        size.counterOffsetX = CGFloat(8.0)
        size.counterOffsetY = CGFloat(8.0)
        size.endContentSize = CGFloat(24.0)
        size.minHeight = CGFloat(56.0)
        size.paddingEnd = CGFloat(18.0)
        size.paddingStart = CGFloat(18.0)
        size.startContentSize = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
        appearance.actionIcon = Asset.close24.image
        appearance.counterAppearance = Counter.xs.negative.appearance
    
        return .init(
            name: "l",
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

public extension GeneralAppearanceVariation<IconTabItem, TabItemAppearance, IconTabItemVariation.M> {
    
    var m: ComponentAppearanceVariation<IconTabItem, TabItemAppearance> {
        var size =  IconTabItemAnySize(size: appearance.size)
        size.actionIconSize = CGFloat(24)
        size.actionPadding = CGFloat(8.0)
        size.counterOffsetX = CGFloat(8.0)
        size.counterOffsetY = CGFloat(8.0)
        size.counterPadding = CGFloat(6.0)
        size.endContentSize = CGFloat(24.0)
        size.minHeight = CGFloat(48.0)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(14.0)
        size.startContentSize = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
        appearance.actionIcon = Asset.close24.image
        appearance.counterAppearance = Counter.xs.negative.appearance
    
        return .init(
            name: "m",
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

public extension GeneralAppearanceVariation<IconTabItem, TabItemAppearance, IconTabItemVariation.S> {
    
    var s: ComponentAppearanceVariation<IconTabItem, TabItemAppearance> {
        var size =  IconTabItemAnySize(size: appearance.size)
        size.actionIconSize = CGFloat(24)
        size.actionPadding = CGFloat(6.0)
        size.counterOffsetX = CGFloat(6.0)
        size.counterOffsetY = CGFloat(6.0)
        size.counterPadding = CGFloat(4.0)
        size.endContentSize = CGFloat(24.0)
        size.minHeight = CGFloat(40.0)
        size.paddingEnd = CGFloat(10.0)
        size.paddingStart = CGFloat(10.0)
        size.startContentSize = CGFloat(24.0)

        var appearance = appearance
        appearance.size = size
        appearance.actionIcon = Asset.close24.image
        appearance.counterAppearance = Counter.xxs.negative.appearance
    
        return .init(
            name: "s",
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

public extension GeneralAppearanceVariation<IconTabItem, TabItemAppearance, IconTabItemVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<IconTabItem, TabItemAppearance> {
        var size =  IconTabItemAnySize(size: appearance.size)
        size.actionIconSize = CGFloat(16)
        size.actionPadding = CGFloat(4.0)
        size.counterOffsetX = CGFloat(6.0)
        size.counterOffsetY = CGFloat(6.0)
        size.counterPadding = CGFloat(4.0)
        size.endContentSize = CGFloat(16.0)
        size.minHeight = CGFloat(32.0)
        size.paddingEnd = CGFloat(10.0)
        size.paddingStart = CGFloat(10.0)
        size.startContentSize = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.actionIcon = Asset.close16.image
        appearance.counterAppearance = Counter.xxs.negative.appearance
    
        return .init(
            name: "xs",
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


public extension ComponentAppearanceVariation<IconTabItem, TabItemAppearance> {
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

private extension TabItemAppearance {
    
}
