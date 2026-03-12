import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct EmbeddedChipGroupWideTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    var xl: TypographyToken?
    var xs: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        xl: TypographyToken? = nil,
        xs: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
        self.xl = xl
        self.xs = xs
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
        self.xl = oneSize
        self.xs = oneSize
    }
    
    func typography(with size: ChipGroupSizeConfiguration) -> TypographyToken? {
        if size is EmbeddedChipGroupWideAnySize {
            return l
        }
        if size is EmbeddedChipGroupWideSizeL {
            return l
        }
        if size is EmbeddedChipGroupWideSizeM {
            return m
        }
        if size is EmbeddedChipGroupWideSizeS {
            return s
        }
        if size is EmbeddedChipGroupWideSizeXl {
            return xl
        }
        if size is EmbeddedChipGroupWideSizeXs {
            return xs
        }
        return l
    }
}
