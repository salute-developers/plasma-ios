import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CheckboxGroupTypography: GeneralTypographyConfiguration {
    var m: TypographyToken?
    var s: TypographyToken?
    
    init(
        m: TypographyToken? = nil,
        s: TypographyToken? = nil
    ) {
        self.m = m
        self.s = s
    }
    
    init(oneSize: TypographyToken) {
        self.m = oneSize
        self.s = oneSize
    }
    
    func typography(with size: CheckboxGroupSizeConfiguration) -> TypographyToken? {
        if size is CheckboxGroupAnySize {
            return m
        }
        if size is CheckboxGroupSizeM {
            return m
        }
        if size is CheckboxGroupSizeS {
            return s
        }
        return m
    }
}
