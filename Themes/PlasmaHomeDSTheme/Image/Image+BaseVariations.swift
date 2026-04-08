import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Image {
    public static var ratio_1_2: ComponentAppearanceVariation<Image, ImageAppearance> {
        var appearance = ImageAppearance.base
        appearance.size = ImageSize.ratio_1_2
        return .init(name: "ratio_1_2", appearance: appearance)
    }

    public static var ratio_9_16: ComponentAppearanceVariation<Image, ImageAppearance> {
        var appearance = ImageAppearance.base
        appearance.size = ImageSize.ratio_9_16
        return .init(name: "ratio_9_16", appearance: appearance)
    }

    public static var ratio_3_4: ComponentAppearanceVariation<Image, ImageAppearance> {
        var appearance = ImageAppearance.base
        appearance.size = ImageSize.ratio_3_4
        return .init(name: "ratio_3_4", appearance: appearance)
    }

    public static var ratio_2_1: ComponentAppearanceVariation<Image, ImageAppearance> {
        var appearance = ImageAppearance.base
        appearance.size = ImageSize.ratio_2_1
        return .init(name: "ratio_2_1", appearance: appearance)
    }

    public static var ratio_16_9: ComponentAppearanceVariation<Image, ImageAppearance> {
        var appearance = ImageAppearance.base
        appearance.size = ImageSize.ratio_16_9
        return .init(name: "ratio_16_9", appearance: appearance)
    }

    public static var ratio_4_3: ComponentAppearanceVariation<Image, ImageAppearance> {
        var appearance = ImageAppearance.base
        appearance.size = ImageSize.ratio_4_3
        return .init(name: "ratio_4_3", appearance: appearance)
    }

    public static var ratio_1_1: ComponentAppearanceVariation<Image, ImageAppearance> {
        var appearance = ImageAppearance.base
        appearance.size = ImageSize.ratio_1_1
        return .init(name: "ratio_1_1", appearance: appearance)
    }

    public static let all: [Variation<ImageAppearance>] = [
        Image.ratio_1_2.variation,
        Image.ratio_9_16.variation,
        Image.ratio_3_4.variation,
        Image.ratio_2_1.variation,
        Image.ratio_16_9.variation,
        Image.ratio_4_3.variation,
        Image.ratio_1_1.variation
    ]
}

public struct ImageVariation {
    public struct Ratio_1_2 {}
    public struct Ratio_9_16 {}
    public struct Ratio_3_4 {}
    public struct Ratio_2_1 {}
    public struct Ratio_16_9 {}
    public struct Ratio_4_3 {}
    public struct Ratio_1_1 {}
}

private extension ImageAppearance {
    static var base: ImageAppearance {
        ImageAppearance()
    }
}
