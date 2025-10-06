import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<Loader, LoaderAppearance, LoaderVariation.Default> {
    
    var `default`: ComponentAppearanceVariation<Loader, LoaderAppearance> {
        var size =  LoaderAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.circularProgressAppearance = CircularProgressBar.m.default.appearance
        appearance.spinnerAppearance = Spinner.m.default.appearance
    
        return .init(
            name: "default",
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


public extension ComponentAppearanceVariation<Loader, LoaderAppearance> {
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

private extension LoaderAppearance {
    
}
