import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CardSolidTypography: GeneralTypographyConfiguration {
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
        if size is CardSolidAnySize {
            return l
        }
        if size is CardSolidSizeL {
            return l
        }
        if size is CardSolidSizeM {
            return m
        }
        if size is CardSolidSizeS {
            return s
        }
        return l
    }
}
