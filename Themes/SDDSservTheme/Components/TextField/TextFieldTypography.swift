import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextFieldTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    var xl: TypographyToken?
    var xs: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        xl: TypographyToken? = nil,
        xs: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
        self.xl = xl
        self.xs = xs
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
        self.xl = oneSize
        self.xs = oneSize
    }
    
    func typography(with size: TextFieldSizeConfiguration) -> TypographyToken? {
        if size is TextFieldAnySize {
            return l
        }
        if size is TextFieldSizeL {
            return l
        }
        if size is TextFieldSizeM {
            return m
        }
        if size is TextFieldSizeS {
            return s
        }
        if size is TextFieldSizeXl {
            return xl
        }
        if size is TextFieldSizeXs {
            return xs
        }
        return nil
    }
}
