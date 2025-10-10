import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct RadioboxTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: SelectionControlSizeConfiguration) -> TypographyToken? {
        if size is RadioboxAnySize {
            return l
        }
        if size is RadioboxSizeL {
            return l
        }
        if size is RadioboxSizeM {
            return m
        }
        if size is RadioboxSizeS {
            return s
        }
        return l
    }
}
