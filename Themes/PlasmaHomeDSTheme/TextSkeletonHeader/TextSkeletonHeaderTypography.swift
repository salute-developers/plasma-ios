import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextSkeletonHeaderTypography: GeneralTypographyConfiguration {
    var h1: TypographyToken?
    var h2: TypographyToken?
    var h3: TypographyToken?
    var h4: TypographyToken?
    var h5: TypographyToken?
    var h6: TypographyToken?
    
    init(
        h1: TypographyToken? = nil,
        h2: TypographyToken? = nil,
        h3: TypographyToken? = nil,
        h4: TypographyToken? = nil,
        h5: TypographyToken? = nil,
        h6: TypographyToken? = nil
    ) {
        self.h1 = h1
        self.h2 = h2
        self.h3 = h3
        self.h4 = h4
        self.h5 = h5
        self.h6 = h6
    }
    
    init(oneSize: TypographyToken) {
        self.h1 = oneSize
        self.h2 = oneSize
        self.h3 = oneSize
        self.h4 = oneSize
        self.h5 = oneSize
        self.h6 = oneSize
    }
    
    func typography(with size: SkeletonSizeConfiguration) -> TypographyToken? {
        if size is TextSkeletonHeaderAnySize {
            return h1
        }
        if size is TextSkeletonHeaderSizeH1 {
            return h1
        }
        if size is TextSkeletonHeaderSizeH2 {
            return h2
        }
        if size is TextSkeletonHeaderSizeH3 {
            return h3
        }
        if size is TextSkeletonHeaderSizeH4 {
            return h4
        }
        if size is TextSkeletonHeaderSizeH5 {
            return h5
        }
        if size is TextSkeletonHeaderSizeH6 {
            return h6
        }
        return h1
    }
}
