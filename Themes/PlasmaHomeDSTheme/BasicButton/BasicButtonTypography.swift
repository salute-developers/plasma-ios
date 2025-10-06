import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BasicButtonTypography: GeneralTypographyConfiguration {
    var m: TypographyToken?
    var s: TypographyToken?
    var xs: TypographyToken?
    
    init(
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        xs: TypographyToken? = nil
    ) {
        self.m = m
        self.s = s
        self.xs = xs
    }
    
    init(oneSize: TypographyToken) {
        self.m = oneSize
        self.s = oneSize
        self.xs = oneSize
    }
    
    func typography(with size: ButtonSizeConfiguration) -> TypographyToken? {
        if size is BasicButtonAnySize {
            return m
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
        return m
    }
}
