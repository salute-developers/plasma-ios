import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SelectMultipleNormalTypography: GeneralTypographyConfiguration {
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
        if size is SelectMultipleNormalAnySize {
            return l
        }
        if size is SelectMultipleNormalSizeL {
            return l
        }
        if size is SelectMultipleNormalSizeM {
            return m
        }
        if size is SelectMultipleNormalSizeS {
            return s
        }
        if size is SelectMultipleNormalSizeXl {
            return xl
        }
        if size is SelectMultipleNormalSizeXs {
            return xs
        }
        return l
    }
}
