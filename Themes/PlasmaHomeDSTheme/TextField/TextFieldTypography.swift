import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextFieldTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
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
        return l
    }
}
