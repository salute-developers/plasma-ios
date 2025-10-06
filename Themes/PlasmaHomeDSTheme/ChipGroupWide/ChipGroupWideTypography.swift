import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ChipGroupWideTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: ChipGroupSizeConfiguration) -> TypographyToken? {
        if size is ChipGroupWideAnySize {
            return l
        }
        if size is ChipGroupWideSizeL {
            return l
        }
        if size is ChipGroupWideSizeM {
            return m
        }
        if size is ChipGroupWideSizeS {
            return s
        }
        if size is ChipGroupWideSizeXs {
            return xs
        }
        if size is ChipGroupWideSizeXxs {
            return xxs
        }
        return l
    }
}
