import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct EmbeddedChipGroupDenseTypography: GeneralTypographyConfiguration {
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
        if size is EmbeddedChipGroupDenseAnySize {
            return l
        }
        if size is EmbeddedChipGroupDenseSizeL {
            return l
        }
        if size is EmbeddedChipGroupDenseSizeM {
            return m
        }
        if size is EmbeddedChipGroupDenseSizeS {
            return s
        }
        if size is EmbeddedChipGroupDenseSizeXl {
            return xl
        }
        if size is EmbeddedChipGroupDenseSizeXs {
            return xs
        }
        return l
    }
}
