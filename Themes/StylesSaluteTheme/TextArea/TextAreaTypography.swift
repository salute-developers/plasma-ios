import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextAreaTypography: GeneralTypographyConfiguration {
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
        if size is TextAreaSizeXs {
            return xs
        }
        return l
    }
}
