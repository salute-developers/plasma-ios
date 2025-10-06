import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SpinnerTypography: GeneralTypographyConfiguration {
    var m: TypographyToken?
    var s: TypographyToken?
    var scalable: TypographyToken?
    var xs: TypographyToken?
    var xxs: TypographyToken?
    
    init(
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        scalable: TypographyToken? = nil,
        xs: TypographyToken? = nil,
        xxs: TypographyToken? = nil
    ) {
        self.m = m
        self.s = s
        self.scalable = scalable
        self.xs = xs
        self.xxs = xxs
    }
    
    init(oneSize: TypographyToken) {
        self.m = oneSize
        self.s = oneSize
        self.scalable = oneSize
        self.xs = oneSize
        self.xxs = oneSize
    }
    
    func typography(with size: SpinnerSizeConfiguration) -> TypographyToken? {
        if size is SpinnerAnySize {
            return m
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
        if size is SpinnerSizeXs {
            return xs
        }
        if size is SpinnerSizeXxs {
            return xxs
        }
        return m
    }
}
