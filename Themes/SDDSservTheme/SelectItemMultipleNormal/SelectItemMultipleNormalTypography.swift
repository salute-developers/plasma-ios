import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SelectItemMultipleNormalTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: SelectItemSizeConfiguration) -> TypographyToken? {
        if size is SelectItemMultipleNormalAnySize {
            return l
        }
        if size is SelectItemMultipleNormalSizeL {
            return l
        }
        if size is SelectItemMultipleNormalSizeM {
            return m
        }
        if size is SelectItemMultipleNormalSizeS {
            return s
        }
        if size is SelectItemMultipleNormalSizeXl {
            return xl
        }
        if size is SelectItemMultipleNormalSizeXs {
            return xs
        }
        return l
    }
}
