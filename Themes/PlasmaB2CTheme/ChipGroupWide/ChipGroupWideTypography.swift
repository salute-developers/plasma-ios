import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ChipGroupWideTypography: GeneralTypographyConfiguration {
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
        return l
    }
}
