import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ChipTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: ChipSizeConfiguration) -> TypographyToken? {
        if size is ChipAnySize {
            return l
        }
        if size is ChipSizeL {
            return l
        }
        if size is ChipSizeM {
            return m
        }
        if size is ChipSizeS {
            return s
        }
        if size is ChipSizeXs {
            return xs
        }
        if size is ChipSizeXxs {
            return xxs
        }
        return nil
    }
}
