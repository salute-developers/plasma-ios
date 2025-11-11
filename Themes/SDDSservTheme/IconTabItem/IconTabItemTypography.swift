import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct IconTabItemTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: TabItemSizeConfiguration) -> TypographyToken? {
        if size is IconTabItemAnySize {
            return l
        }
        if size is IconTabItemSizeL {
            return l
        }
        if size is IconTabItemSizeM {
            return m
        }
        if size is IconTabItemSizeS {
            return s
        }
        if size is IconTabItemSizeXs {
            return xs
        }
        return l
    }
}
