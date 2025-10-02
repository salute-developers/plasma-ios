import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct LinkButtonTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: ButtonSizeConfiguration) -> TypographyToken? {
        if size is LinkButtonAnySize {
            return l
        }
        if size is LinkButtonSizeL {
            return l
        }
        if size is LinkButtonSizeM {
            return m
        }
        if size is LinkButtonSizeS {
            return s
        }
        if size is LinkButtonSizeXs {
            return xs
        }
        return l
    }
}
