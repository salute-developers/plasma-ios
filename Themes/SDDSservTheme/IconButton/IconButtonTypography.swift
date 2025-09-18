import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct IconButtonTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    var xl: TypographyToken?
    var xs: TypographyToken?
    var xxs: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        xl: TypographyToken? = nil,
        xs: TypographyToken? = nil,
        xxs: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
        self.xl = xl
        self.xs = xs
        self.xxs = xxs
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
        self.xl = oneSize
        self.xs = oneSize
        self.xxs = oneSize
    }
    
    func typography(with size: ButtonSizeConfiguration) -> TypographyToken? {
        if size is IconButtonAnySize {
            return l
        }
        if size is IconButtonSizeL {
            return l
        }
        if size is IconButtonSizeM {
            return m
        }
        if size is IconButtonSizeS {
            return s
        }
        if size is IconButtonSizeXl {
            return xl
        }
        if size is IconButtonSizeXs {
            return xs
        }
        if size is IconButtonSizeXxs {
            return xxs
        }
        return l
    }
}
