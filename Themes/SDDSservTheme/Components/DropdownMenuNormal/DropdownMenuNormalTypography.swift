import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DropdownMenuNormalTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: DropdownMenuSizeConfiguration) -> TypographyToken? {
        if size is DropdownMenuNormalAnySize {
            return l
        }
        if size is DropdownMenuNormalSizeL {
            return l
        }
        if size is DropdownMenuNormalSizeM {
            return m
        }
        if size is DropdownMenuNormalSizeS {
            return s
        }
        if size is DropdownMenuNormalSizeXl {
            return xl
        }
        if size is DropdownMenuNormalSizeXs {
            return xs
        }
        return nil
    }
}
