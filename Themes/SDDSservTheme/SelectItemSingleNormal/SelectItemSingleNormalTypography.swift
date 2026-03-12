import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SelectItemSingleNormalTypography: GeneralTypographyConfiguration {
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
        if size is SelectItemSingleNormalAnySize {
            return l
        }
        if size is SelectItemSingleNormalSizeL {
            return l
        }
        if size is SelectItemSingleNormalSizeM {
            return m
        }
        if size is SelectItemSingleNormalSizeS {
            return s
        }
        if size is SelectItemSingleNormalSizeXl {
            return xl
        }
        if size is SelectItemSingleNormalSizeXs {
            return xs
        }
        return l
    }
}
