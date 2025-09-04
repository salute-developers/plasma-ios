import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextAreaClearTypography: GeneralTypographyConfiguration {
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
        if size is TextAreaClearAnySize {
            return l
        }
        if size is TextAreaClearSizeL {
            return l
        }
        if size is TextAreaClearSizeM {
            return m
        }
        if size is TextAreaClearSizeS {
            return s
        }
        if size is TextAreaClearSizeXl {
            return xl
        }
        if size is TextAreaClearSizeXs {
            return xs
        }
        return nil
    }
}
