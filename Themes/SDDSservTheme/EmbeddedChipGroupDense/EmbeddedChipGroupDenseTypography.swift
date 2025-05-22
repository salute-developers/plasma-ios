import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct EmbeddedChipGroupDenseTypography: GeneralTypographyConfiguration {
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
        if size is EmbeddedChipGroupDenseSizeXs {
            return xs
        }
        return nil
    }
}
