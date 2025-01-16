import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextAreaClearTypography: GeneralTypographyConfiguration {
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
        if size is TextAreaClearSizeL {
            return l
        }
        if size is TextAreaClearSizeM {
            return m
        }
        if size is TextAreaClearSizeS {
            return s
        }
        if size is TextAreaClearSizeXs {
            return xs
        }
        return nil
    }
}
