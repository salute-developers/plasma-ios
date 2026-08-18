import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<Image, ImageAppearance, ImageVariation.Ratio_16_9> {
    
    var ratio_16_9: ComponentAppearanceVariation<Image, ImageAppearance> {
        var size =  ImageAnySize(size: appearance.size)
        size.ratioHeight = CGFloat(9.0)
        size.ratioWidth = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "ratio_16_9",
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

public extension GeneralAppearanceVariation<Image, ImageAppearance, ImageVariation.Ratio_1_1> {
    
    var ratio_1_1: ComponentAppearanceVariation<Image, ImageAppearance> {
        var size =  ImageAnySize(size: appearance.size)
        size.ratioHeight = CGFloat(1.0)
        size.ratioWidth = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "ratio_1_1",
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

public extension GeneralAppearanceVariation<Image, ImageAppearance, ImageVariation.Ratio_1_2> {
    
    var ratio_1_2: ComponentAppearanceVariation<Image, ImageAppearance> {
        var size =  ImageAnySize(size: appearance.size)
        size.ratioHeight = CGFloat(2.0)
        size.ratioWidth = CGFloat(1.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "ratio_1_2",
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

public extension GeneralAppearanceVariation<Image, ImageAppearance, ImageVariation.Ratio_2_1> {
    
    var ratio_2_1: ComponentAppearanceVariation<Image, ImageAppearance> {
        var size =  ImageAnySize(size: appearance.size)
        size.ratioHeight = CGFloat(1.0)
        size.ratioWidth = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "ratio_2_1",
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

public extension GeneralAppearanceVariation<Image, ImageAppearance, ImageVariation.Ratio_3_4> {
    
    var ratio_3_4: ComponentAppearanceVariation<Image, ImageAppearance> {
        var size =  ImageAnySize(size: appearance.size)
        size.ratioHeight = CGFloat(4.0)
        size.ratioWidth = CGFloat(3.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "ratio_3_4",
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

public extension GeneralAppearanceVariation<Image, ImageAppearance, ImageVariation.Ratio_4_3> {
    
    var ratio_4_3: ComponentAppearanceVariation<Image, ImageAppearance> {
        var size =  ImageAnySize(size: appearance.size)
        size.ratioHeight = CGFloat(3.0)
        size.ratioWidth = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "ratio_4_3",
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

public extension GeneralAppearanceVariation<Image, ImageAppearance, ImageVariation.Ratio_9_16> {
    
    var ratio_9_16: ComponentAppearanceVariation<Image, ImageAppearance> {
        var size =  ImageAnySize(size: appearance.size)
        size.ratioHeight = CGFloat(16.0)
        size.ratioWidth = CGFloat(9.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "ratio_9_16",
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


public extension ComponentAppearanceVariation<Image, ImageAppearance> {
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

private extension ImageAppearance {
    
}

