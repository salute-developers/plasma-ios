import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextFieldClearTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: TextFieldSizeConfiguration) -> TypographyToken? {
        if size is TextFieldClearAnySize {
            return l
        }
        if size is TextFieldClearSizeL {
            return l
        }
        if size is TextFieldClearSizeM {
            return m
        }
        if size is TextFieldClearSizeS {
            return s
        }
        if size is TextFieldClearSizeXs {
            return xs
        }
        return l
    }
}
