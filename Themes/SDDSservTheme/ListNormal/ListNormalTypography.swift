import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListNormalTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: ListSizeConfiguration) -> TypographyToken? {
        if size is ListNormalAnySize {
            return l
        }
        if size is ListNormalSizeL {
            return l
        }
        if size is ListNormalSizeM {
            return m
        }
        if size is ListNormalSizeS {
            return s
        }
        if size is ListNormalSizeXl {
            return xl
        }
        if size is ListNormalSizeXs {
            return xs
        }
        return nil
    }
}
