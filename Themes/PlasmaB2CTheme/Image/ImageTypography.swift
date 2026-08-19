import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ImageTypography: GeneralTypographyConfiguration {
    var ratio_16_9: TypographyToken?
    var ratio_1_1: TypographyToken?
    var ratio_1_2: TypographyToken?
    var ratio_2_1: TypographyToken?
    var ratio_3_4: TypographyToken?
    var ratio_4_3: TypographyToken?
    var ratio_9_16: TypographyToken?
    
    init(
        ratio_16_9: TypographyToken? = nil,
        ratio_1_1: TypographyToken? = nil,
        ratio_1_2: TypographyToken? = nil,
        ratio_2_1: TypographyToken? = nil,
        ratio_3_4: TypographyToken? = nil,
        ratio_4_3: TypographyToken? = nil,
        ratio_9_16: TypographyToken? = nil
    ) {
        self.ratio_16_9 = ratio_16_9
        self.ratio_1_1 = ratio_1_1
        self.ratio_1_2 = ratio_1_2
        self.ratio_2_1 = ratio_2_1
        self.ratio_3_4 = ratio_3_4
        self.ratio_4_3 = ratio_4_3
        self.ratio_9_16 = ratio_9_16
    }
    
    init(oneSize: TypographyToken) {
        self.ratio_16_9 = oneSize
        self.ratio_1_1 = oneSize
        self.ratio_1_2 = oneSize
        self.ratio_2_1 = oneSize
        self.ratio_3_4 = oneSize
        self.ratio_4_3 = oneSize
        self.ratio_9_16 = oneSize
    }
    
    func typography(with size: ImageSizeConfiguration) -> TypographyToken? {
        if size is ImageAnySize {
            return ratio_16_9
        }
        if size is ImageSizeRatio_16_9 {
            return ratio_16_9
        }
        if size is ImageSizeRatio_1_1 {
            return ratio_1_1
        }
        if size is ImageSizeRatio_1_2 {
            return ratio_1_2
        }
        if size is ImageSizeRatio_2_1 {
            return ratio_2_1
        }
        if size is ImageSizeRatio_3_4 {
            return ratio_3_4
        }
        if size is ImageSizeRatio_4_3 {
            return ratio_4_3
        }
        if size is ImageSizeRatio_9_16 {
            return ratio_9_16
        }
        return ratio_16_9
    }
}
