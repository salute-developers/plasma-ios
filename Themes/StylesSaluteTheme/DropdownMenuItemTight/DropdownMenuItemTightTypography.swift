import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DropdownMenuItemTightTypography: GeneralTypographyConfiguration {
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
        if size is DropdownMenuItemTightAnySize {
            return l
        }
        if size is DropdownMenuItemTightSizeL {
            return l
        }
        if size is DropdownMenuItemTightSizeM {
            return m
        }
        if size is DropdownMenuItemTightSizeS {
            return s
        }
        if size is DropdownMenuItemTightSizeXs {
            return xs
        }
        return l
    }
}
