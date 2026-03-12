import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct EmbeddedChipTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: ChipSizeConfiguration) -> TypographyToken? {
        if size is EmbeddedChipAnySize {
            return l
        }
        if size is EmbeddedChipSizeL {
            return l
        }
        if size is EmbeddedChipSizeM {
            return m
        }
        if size is EmbeddedChipSizeS {
            return s
        }
        if size is EmbeddedChipSizeXl {
            return xl
        }
        if size is EmbeddedChipSizeXs {
            return xs
        }
        return l
    }
}
