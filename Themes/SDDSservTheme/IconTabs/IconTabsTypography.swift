import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct IconTabsTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: TabsSizeConfiguration) -> TypographyToken? {
        if size is IconTabsAnySize {
            return l
        }
        if size is IconTabsSizeL {
            return l
        }
        if size is IconTabsSizeM {
            return m
        }
        if size is IconTabsSizeS {
            return s
        }
        if size is IconTabsSizeXs {
            return xs
        }
        return l
    }
}
