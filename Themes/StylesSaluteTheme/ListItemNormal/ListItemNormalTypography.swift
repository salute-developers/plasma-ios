import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListItemNormalTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: ListItemSizeConfiguration) -> TypographyToken? {
        if size is ListItemNormalAnySize {
            return l
        }
        if size is ListItemNormalSizeL {
            return l
        }
        if size is ListItemNormalSizeM {
            return m
        }
        if size is ListItemNormalSizeS {
            return s
        }
        if size is ListItemNormalSizeXl {
            return xl
        }
        if size is ListItemNormalSizeXs {
            return xs
        }
        return l
    }
}
