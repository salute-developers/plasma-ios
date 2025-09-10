import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<CheckboxGroup, CheckboxGroupAppearance, CheckboxGroupVariation.L> {
    
    var l: ComponentAppearanceVariation<CheckboxGroup, CheckboxGroupAppearance> {
        var size =  CheckboxGroupAnySize(size: appearance.size)
        size.horizontalIndent = CGFloat(36.0)
        size.verticalSpacing = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
        appearance.checkboxAppearance = Checkbox.l.default.appearance
    
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

public extension GeneralAppearanceVariation<CheckboxGroup, CheckboxGroupAppearance, CheckboxGroupVariation.M> {
    
    var m: ComponentAppearanceVariation<CheckboxGroup, CheckboxGroupAppearance> {
        var size =  CheckboxGroupAnySize(size: appearance.size)
        size.horizontalIndent = CGFloat(36.0)
        size.verticalSpacing = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.checkboxAppearance = Checkbox.m.default.appearance
    
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

public extension GeneralAppearanceVariation<CheckboxGroup, CheckboxGroupAppearance, CheckboxGroupVariation.S> {
    
    var s: ComponentAppearanceVariation<CheckboxGroup, CheckboxGroupAppearance> {
        var size =  CheckboxGroupAnySize(size: appearance.size)
        size.horizontalIndent = CGFloat(24.0)
        size.verticalSpacing = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.checkboxAppearance = Checkbox.s.default.appearance
    
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


public extension ComponentAppearanceVariation<CheckboxGroup, CheckboxGroupAppearance> {
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

private extension CheckboxGroupAppearance {
    
}
