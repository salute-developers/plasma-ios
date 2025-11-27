import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabsDefaultTypography: GeneralTypographyConfiguration {
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
        if size is TabsDefaultAnySize {
            return l
        }
        if size is TabsDefaultSizeL {
            return l
        }
        if size is TabsDefaultSizeM {
            return m
        }
        if size is TabsDefaultSizeS {
            return s
        }
        if size is TabsDefaultSizeXs {
            return xs
        }
        return l
    }
}
