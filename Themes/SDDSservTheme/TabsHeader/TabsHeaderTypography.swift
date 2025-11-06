import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabsHeaderTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: TabsSizeConfiguration) -> TypographyToken? {
        if size is TabsHeaderAnySize {
            return h1
        }
        if size is TabsHeaderSizeH1 {
            return h1
        }
        if size is TabsHeaderSizeH2 {
            return h2
        }
        if size is TabsHeaderSizeH3 {
            return h3
        }
        if size is TabsHeaderSizeH4 {
            return h4
        }
        if size is TabsHeaderSizeH5 {
            return h5
        }
        return h1
    }
}
