import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Toast, ToastAppearance, ToastVariation.Pilled> {
    
    var pilled: ComponentAppearanceVariation<Toast, ToastAppearance> {
        var size =  ToastAnySize(size: appearance.size)
        size.shape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ToastAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<ToastAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ToastAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Toast, ToastAppearance, ToastVariation.Rounded> {
    
    var rounded: ComponentAppearanceVariation<Toast, ToastAppearance> {
        var size =  ToastAnySize(size: appearance.size)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "rounded",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ToastAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<ToastAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ToastAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<Toast, ToastAppearance> {
    var `default`: AppearanceVariation<ToastAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<ToastAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ToastAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension ToastAppearance {
    
    var `default`: ToastAppearance {
        var appearance = self
        appearance.contentStartColor = ColorToken.textDefaultPrimary
        return appearance
    }
    
    var negative: ToastAppearance {
        var appearance = self
        appearance.contentStartColor = ColorToken.textDefaultNegative
        return appearance
    }
    
    var positive: ToastAppearance {
        var appearance = self
        appearance.contentStartColor = ColorToken.textDefaultPositive
        return appearance
    }
    
}
