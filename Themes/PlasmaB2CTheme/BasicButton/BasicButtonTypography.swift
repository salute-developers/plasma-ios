import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BasicButtonTypography: GeneralTypographyConfiguration {
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
        if size is BasicButtonAnySize {
            return l
        }
        if size is BasicButtonSizeL {
            return l
        }
        if size is BasicButtonSizeM {
            return m
        }
        if size is BasicButtonSizeS {
            return s
        }
        if size is BasicButtonSizeXl {
            return xl
        }
        if size is BasicButtonSizeXs {
            return xs
        }
        if size is BasicButtonSizeXxs {
            return xxs
        }
        return l
    }
}
