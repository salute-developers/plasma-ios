import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabItemHeaderTypography: GeneralTypographyConfiguration {
    var h1: TypographyToken?
    var h2: TypographyToken?
    var h3: TypographyToken?
    var h4: TypographyToken?
    var h5: TypographyToken?
    
    init(
        h1: TypographyToken? = nil,
        h2: TypographyToken? = nil,
        h3: TypographyToken? = nil,
        h4: TypographyToken? = nil,
        h5: TypographyToken? = nil
    ) {
        self.h1 = h1
        self.h2 = h2
        self.h3 = h3
        self.h4 = h4
        self.h5 = h5
    }
    
    init(oneSize: TypographyToken) {
        self.h1 = oneSize
        self.h2 = oneSize
        self.h3 = oneSize
        self.h4 = oneSize
        self.h5 = oneSize
    }
    
    func typography(with size: TabItemSizeConfiguration) -> TypographyToken? {
        if size is TabItemHeaderAnySize {
            return h1
        }
        if size is TabItemHeaderSizeH1 {
            return h1
        }
        if size is TabItemHeaderSizeH2 {
            return h2
        }
        if size is TabItemHeaderSizeH3 {
            return h3
        }
        if size is TabItemHeaderSizeH4 {
            return h4
        }
        if size is TabItemHeaderSizeH5 {
            return h5
        }
        return h1
    }
}
