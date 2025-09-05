import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CheckboxGroupTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: CheckboxGroupSizeConfiguration) -> TypographyToken? {
        if size is CheckboxGroupAnySize {
            return l
        }
        if size is CheckboxGroupSizeL {
            return l
        }
        if size is CheckboxGroupSizeM {
            return m
        }
        if size is CheckboxGroupSizeS {
            return s
        }
        return nil
    }
}
