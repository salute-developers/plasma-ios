import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BadgeTransparentTypography: GeneralTypographyConfiguration {
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
        if size is BadgeTransparentAnySize {
            return l
        }
        if size is BadgeTransparentSizeL {
            return l
        }
        if size is BadgeTransparentSizeM {
            return m
        }
        if size is BadgeTransparentSizeS {
            return s
        }
        if size is BadgeTransparentSizeXs {
            return xs
        }
        return l
    }
}
