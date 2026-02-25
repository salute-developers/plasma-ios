import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Toast, ToastAppearance, ToastVariation.Default> {
    
    var `default`: AppearanceVariation<ToastAppearance> {
        var appearance = appearance
        appearance.contentStartColor = ColorToken.textInversePrimary
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<ToastAppearance> {
        var appearance = appearance
        appearance.contentStartColor = ColorToken.textInverseNegative
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<ToastAppearance> {
        var appearance = appearance
        appearance.contentStartColor = ColorToken.textInversePositive
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var variation: Variation<ToastAppearance> {
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
        appearance.contentStartColor = ColorToken.textInversePrimary
        return appearance
    }
    
    var negative: ToastAppearance {
        var appearance = self
        appearance.contentStartColor = ColorToken.textInverseNegative
        return appearance
    }
    
    var positive: ToastAppearance {
        var appearance = self
        appearance.contentStartColor = ColorToken.textInversePositive
        return appearance
    }
    
}
