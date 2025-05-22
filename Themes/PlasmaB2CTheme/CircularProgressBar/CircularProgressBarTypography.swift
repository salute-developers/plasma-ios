import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CircularProgressBarTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    var xl: TypographyToken?
    var xs: TypographyToken?
    var xxl: TypographyToken?
    var xxs: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        xl: TypographyToken? = nil,
        xs: TypographyToken? = nil,
        xxl: TypographyToken? = nil,
        xxs: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
        self.xl = xl
        self.xs = xs
        self.xxl = xxl
        self.xxs = xxs
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
        self.xl = oneSize
        self.xs = oneSize
        self.xxl = oneSize
        self.xxs = oneSize
    }
    
    func typography(with size: CircularProgressBarSizeConfiguration) -> TypographyToken? {
        if size is CircularProgressBarAnySize {
            return l
        }
        if size is CircularProgressBarSizeL {
            return l
        }
        if size is CircularProgressBarSizeM {
            return m
        }
        if size is CircularProgressBarSizeS {
            return s
        }
        if size is CircularProgressBarSizeXl {
            return xl
        }
        if size is CircularProgressBarSizeXs {
            return xs
        }
        if size is CircularProgressBarSizeXxl {
            return xxl
        }
        if size is CircularProgressBarSizeXxs {
            return xxs
        }
        return nil
    }
}
