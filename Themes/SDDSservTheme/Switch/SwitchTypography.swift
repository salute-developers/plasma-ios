import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SwitchTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: SwitchSizeConfiguration) -> TypographyToken? {
        if size is SwitchAnySize {
            return l
        }
        if size is SwitchSizeL {
            return l
        }
        if size is SwitchSizeM {
            return m
        }
        if size is SwitchSizeS {
            return s
        }
        return l
    }
}
