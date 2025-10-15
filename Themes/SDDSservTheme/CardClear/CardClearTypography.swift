import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CardClearTypography: GeneralTypographyConfiguration {
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
        if size is CardClearAnySize {
            return l
        }
        if size is CardClearSizeL {
            return l
        }
        if size is CardClearSizeM {
            return m
        }
        if size is CardClearSizeS {
            return s
        }
        return l
    }
}
