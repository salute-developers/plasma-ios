import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CounterTypography: GeneralTypographyConfiguration {
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
        if size is CounterAnySize {
            return l
        }
        if size is CounterSizeL {
            return l
        }
        if size is CounterSizeM {
            return m
        }
        if size is CounterSizeS {
            return s
        }
        if size is CounterSizeXs {
            return xs
        }
        if size is CounterSizeXxs {
            return xxs
        }
        return nil
    }
}
