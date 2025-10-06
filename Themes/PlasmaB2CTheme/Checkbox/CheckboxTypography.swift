import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CheckboxTypography: GeneralTypographyConfiguration {
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
        if size is CheckboxAnySize {
            return l
        }
        if size is CheckboxSizeL {
            return l
        }
        if size is CheckboxSizeM {
            return m
        }
        if size is CheckboxSizeS {
            return s
        }
        return l
    }
}
