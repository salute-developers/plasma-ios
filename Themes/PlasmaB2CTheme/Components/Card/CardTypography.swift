import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CardTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: CardSizeConfiguration) -> TypographyToken? {
        if size is CardAnySize {
            return l
        }
        if size is CardSizeL {
            return l
        }
        if size is CardSizeM {
            return m
        }
        if size is CardSizeS {
            return s
        }
        return nil
    }
}
