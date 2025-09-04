import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SpinnerTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    var scalable: TypographyToken?
    var xl: TypographyToken?
    var xs: TypographyToken?
    var xxl: TypographyToken?
    var xxs: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        scalable: TypographyToken? = nil,
        xl: TypographyToken? = nil,
        xs: TypographyToken? = nil,
        xxl: TypographyToken? = nil,
        xxs: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
        self.scalable = scalable
        self.xl = xl
        self.xs = xs
        self.xxl = xxl
        self.xxs = xxs
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
        self.scalable = oneSize
        self.xl = oneSize
        self.xs = oneSize
        self.xxl = oneSize
        self.xxs = oneSize
    }
    
    func typography(with size: SpinnerSizeConfiguration) -> TypographyToken? {
        if size is SpinnerAnySize {
            return l
        }
        if size is SpinnerSizeL {
            return l
        }
        if size is SpinnerSizeM {
            return m
        }
        if size is SpinnerSizeS {
            return s
        }
        if size is SpinnerSizeScalable {
            return scalable
        }
        if size is SpinnerSizeXl {
            return xl
        }
        if size is SpinnerSizeXs {
            return xs
        }
        if size is SpinnerSizeXxl {
            return xxl
        }
        if size is SpinnerSizeXxs {
            return xxs
        }
        return nil
    }
}
