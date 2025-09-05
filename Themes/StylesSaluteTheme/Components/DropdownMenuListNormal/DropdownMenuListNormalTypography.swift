import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DropdownMenuListNormalTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: ListSizeConfiguration) -> TypographyToken? {
        if size is DropdownMenuListNormalAnySize {
            return l
        }
        if size is DropdownMenuListNormalSizeL {
            return l
        }
        if size is DropdownMenuListNormalSizeM {
            return m
        }
        if size is DropdownMenuListNormalSizeS {
            return s
        }
        if size is DropdownMenuListNormalSizeXs {
            return xs
        }
        return nil
    }
}
