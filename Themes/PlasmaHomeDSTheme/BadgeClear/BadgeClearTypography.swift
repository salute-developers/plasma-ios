import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BadgeClearTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    var xs: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        xs: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
        self.xs = xs
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
        self.xs = oneSize
    }
    
    func typography(with size: BadgeSizeConfiguration) -> TypographyToken? {
        if size is BadgeClearAnySize {
            return l
        }
        if size is BadgeClearSizeL {
            return l
        }
        if size is BadgeClearSizeM {
            return m
        }
        if size is BadgeClearSizeS {
            return s
        }
        if size is BadgeClearSizeXs {
            return xs
        }
        return l
    }
}
