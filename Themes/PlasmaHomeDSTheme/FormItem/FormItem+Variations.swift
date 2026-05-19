import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<FormItem, FormItemAppearance, FormItemVariation.Default> {
    
    var `default`: AppearanceVariation<FormItemAppearance> {
        var appearance = appearance
        appearance.captionColor = StatefulColor(defaultValue: ColorToken.textDefaultSecondary)
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        var appearance = appearance
        appearance.captionColor = StatefulColor(defaultValue: ColorToken.textDefaultNegative)
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        var appearance = appearance
        appearance.captionColor = StatefulColor(defaultValue: ColorToken.textDefaultPositive)
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        var appearance = appearance
        appearance.captionColor = StatefulColor(defaultValue: ColorToken.textDefaultWarning)
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<FormItemAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<FormItem, FormItemAppearance> {
    var `default`: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var warning: AppearanceVariation<FormItemAppearance> {
        return .init(
            name: "warning",
            appearance: appearance.warning
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension FormItemAppearance {
    
    var `default`: FormItemAppearance {
        var appearance = self
        appearance.captionColor = StatefulColor(defaultValue: ColorToken.textDefaultSecondary)
        return appearance
    }
    
    var negative: FormItemAppearance {
        var appearance = self
        appearance.captionColor = StatefulColor(defaultValue: ColorToken.textDefaultNegative)
        return appearance
    }
    
    var positive: FormItemAppearance {
        var appearance = self
        appearance.captionColor = StatefulColor(defaultValue: ColorToken.textDefaultPositive)
        return appearance
    }
    
    var warning: FormItemAppearance {
        var appearance = self
        appearance.captionColor = StatefulColor(defaultValue: ColorToken.textDefaultWarning)
        return appearance
    }
    
}
