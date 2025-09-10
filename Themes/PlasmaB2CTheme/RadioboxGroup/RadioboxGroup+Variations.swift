import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<RadioboxGroup, RadioboxGroupAppearance, RadioboxGroupVariation.M> {
    
    var m: ComponentAppearanceVariation<RadioboxGroup, RadioboxGroupAppearance> {
        var size =  RadioboxGroupAnySize(size: appearance.size)
        size.verticalSpacing = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.radioboxAppearance = Radiobox.m.appearance
    
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

public extension GeneralAppearanceVariation<RadioboxGroup, RadioboxGroupAppearance, RadioboxGroupVariation.S> {
    
    var s: ComponentAppearanceVariation<RadioboxGroup, RadioboxGroupAppearance> {
        var size =  RadioboxGroupAnySize(size: appearance.size)
        size.verticalSpacing = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.radioboxAppearance = Radiobox.s.appearance
    
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


public extension ComponentAppearanceVariation<RadioboxGroup, RadioboxGroupAppearance> {
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

private extension RadioboxGroupAppearance {
    
}
