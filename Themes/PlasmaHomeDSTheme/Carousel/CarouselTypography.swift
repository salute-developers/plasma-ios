import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CarouselTypography: GeneralTypographyConfiguration {
    var buttonsPlacementInner: TypographyToken?
    var buttonsPlacementOuter: TypographyToken?
    
    init(
        buttonsPlacementInner: TypographyToken? = nil,
        buttonsPlacementOuter: TypographyToken? = nil
    ) {
        self.buttonsPlacementInner = buttonsPlacementInner
        self.buttonsPlacementOuter = buttonsPlacementOuter
    }
    
    init(oneSize: TypographyToken) {
        self.buttonsPlacementInner = oneSize
        self.buttonsPlacementOuter = oneSize
    }
    
    func typography(with size: CarouselSizeConfiguration) -> TypographyToken? {
        if size is CarouselAnySize {
            return buttonsPlacementInner
        }
        if size is CarouselSizeButtonsplacementinner {
            return buttonsPlacementInner
        }
        if size is CarouselSizeButtonsplacementouter {
            return buttonsPlacementOuter
        }
        return buttonsPlacementInner
    }
}
