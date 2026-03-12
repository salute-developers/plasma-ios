import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SelectSingleNormalTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: SelectSizeConfiguration) -> TypographyToken? {
        if size is SelectSingleNormalAnySize {
            return l
        }
        if size is SelectSingleNormalSizeL {
            return l
        }
        if size is SelectSingleNormalSizeM {
            return m
        }
        if size is SelectSingleNormalSizeS {
            return s
        }
        if size is SelectSingleNormalSizeXl {
            return xl
        }
        if size is SelectSingleNormalSizeXs {
            return xs
        }
        return l
    }
}
