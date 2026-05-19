import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct FormItemTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: FormItemSizeConfiguration) -> TypographyToken? {
        if size is FormItemAnySize {
            return l
        }
        if size is FormItemSizeL {
            return l
        }
        if size is FormItemSizeM {
            return m
        }
        if size is FormItemSizeS {
            return s
        }
        if size is FormItemSizeXs {
            return xs
        }
        return l
    }
}
