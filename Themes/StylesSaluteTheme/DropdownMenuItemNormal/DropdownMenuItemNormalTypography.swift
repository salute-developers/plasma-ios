import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DropdownMenuItemNormalTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: ListItemSizeConfiguration) -> TypographyToken? {
        if size is DropdownMenuItemNormalAnySize {
            return l
        }
        if size is DropdownMenuItemNormalSizeL {
            return l
        }
        if size is DropdownMenuItemNormalSizeM {
            return m
        }
        if size is DropdownMenuItemNormalSizeS {
            return s
        }
        if size is DropdownMenuItemNormalSizeXs {
            return xs
        }
        return nil
    }
}
