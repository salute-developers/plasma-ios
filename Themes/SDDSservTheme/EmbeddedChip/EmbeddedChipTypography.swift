import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct EmbeddedChipTypography: GeneralTypographyConfiguration {
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
        if size is EmbeddedChipSizeXs {
            return xs
        }
        return l
    }
}
