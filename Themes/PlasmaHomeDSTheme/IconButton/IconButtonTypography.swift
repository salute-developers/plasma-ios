import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct IconButtonTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: ButtonSizeConfiguration) -> TypographyToken? {
        if size is IconButtonAnySize {
            return l
        }
        if size is IconButtonSizeL {
            return l
        }
        if size is IconButtonSizeM {
            return m
        }
        if size is IconButtonSizeS {
            return s
        }
        return nil
    }
}
