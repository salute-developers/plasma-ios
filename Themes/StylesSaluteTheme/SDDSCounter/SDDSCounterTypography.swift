import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SDDSCounterTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    var xs: TypographyToken?
    var xxs: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        xs: TypographyToken? = nil,
        xxs: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
        self.xs = xs
        self.xxs = xxs
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
        self.xs = oneSize
        self.xxs = oneSize
    }
    
    func typography(with size: CounterSizeConfiguration) -> TypographyToken? {
        if size is SDDSCounterAnySize {
            return l
        }
        if size is SDDSCounterSizeL {
            return l
        }
        if size is SDDSCounterSizeM {
            return m
        }
        if size is SDDSCounterSizeS {
            return s
        }
        if size is SDDSCounterSizeXs {
            return xs
        }
        if size is SDDSCounterSizeXxs {
            return xxs
        }
        return nil
    }
}
