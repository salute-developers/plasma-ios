import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabItemDefaultTypography: GeneralTypographyConfiguration {
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
        if size is TabItemDefaultAnySize {
            return l
        }
        if size is TabItemDefaultSizeL {
            return l
        }
        if size is TabItemDefaultSizeM {
            return m
        }
        if size is TabItemDefaultSizeS {
            return s
        }
        if size is TabItemDefaultSizeXs {
            return xs
        }
        return l
    }
}
