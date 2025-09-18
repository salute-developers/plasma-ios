import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BasicButtonTypography: GeneralTypographyConfiguration {
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
        if size is BasicButtonAnySize {
            return l
        }
        if size is BasicButtonSizeL {
            return l
        }
        if size is BasicButtonSizeM {
            return m
        }
        if size is BasicButtonSizeS {
            return s
        }
        if size is BasicButtonSizeXs {
            return xs
        }
        return l
    }
}
