import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Loader {
    public static var `default`: ComponentAppearanceVariation<Loader, LoaderAppearance> {
        var appearance = LoaderAppearance.base
        appearance.size = LoaderSize.`default`
        appearance.circularProgressAppearance = CircularProgressBar.m.default.appearance
        appearance.spinnerAppearance = Spinner.m.default.appearance

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<LoaderAppearance>] = [
        Loader.default.variation,
    ]
}

public struct LoaderVariation {
    public struct Default {}
}

private extension LoaderAppearance {
    static var base: LoaderAppearance {
        var appearance = LoaderAppearance()
        appearance.circularProgressAppearance = CircularProgressBar.m.default.appearance
        appearance.spinnerAppearance = Spinner.m.default.appearance
        return appearance
    }
}
