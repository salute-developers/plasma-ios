import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DropdownMenuNormalTypography: GeneralTypographyConfiguration {
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
        if size is DropdownMenuNormalSizeXs {
            return xs
        }
        return l
    }
}
