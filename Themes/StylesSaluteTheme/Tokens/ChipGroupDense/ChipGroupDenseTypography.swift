import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ChipGroupDenseTypography: GeneralTypographyConfiguration {
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
        if size is ChipGroupDenseAnySize {
            return l
        }
        if size is ChipGroupDenseSizeL {
            return l
        }
        if size is ChipGroupDenseSizeM {
            return m
        }
        if size is ChipGroupDenseSizeS {
            return s
        }
        if size is ChipGroupDenseSizeXs {
            return xs
        }
        return nil
    }
}
