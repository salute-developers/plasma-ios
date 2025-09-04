import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BadgeTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: BadgeSizeConfiguration) -> TypographyToken? {
        if size is BadgeAnySize {
            return l
        }
        if size is BadgeSizeL {
            return l
        }
        if size is BadgeSizeM {
            return m
        }
        if size is BadgeSizeS {
            return s
        }
        if size is BadgeSizeXs {
            return xs
        }
        return nil
    }
}
