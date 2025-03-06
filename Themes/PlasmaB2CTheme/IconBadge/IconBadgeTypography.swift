import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct IconBadgeTypography: GeneralTypographyConfiguration {
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
        if size is IconBadgeAnySize {
            return l
        }
        if size is IconBadgeSizeL {
            return l
        }
        if size is IconBadgeSizeM {
            return m
        }
        if size is IconBadgeSizeS {
            return s
        }
        if size is IconBadgeSizeXs {
            return xs
        }
        return nil
    }
}
