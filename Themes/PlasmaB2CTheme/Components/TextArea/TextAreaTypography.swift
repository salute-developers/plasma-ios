import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextAreaTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: TextAreaSizeConfiguration) -> TypographyToken? {
        if size is TextAreaAnySize {
            return l
        }
        if size is TextAreaSizeL {
            return l
        }
        if size is TextAreaSizeM {
            return m
        }
        if size is TextAreaSizeS {
            return s
        }
        if size is TextAreaSizeXl {
            return xl
        }
        if size is TextAreaSizeXs {
            return xs
        }
        return nil
    }
}
