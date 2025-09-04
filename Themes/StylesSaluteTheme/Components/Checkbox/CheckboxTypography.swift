import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CheckboxTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: SelectionControlSizeConfiguration) -> TypographyToken? {
        if size is CheckboxAnySize {
            return m
        }
        if size is CheckboxSizeM {
            return m
        }
        if size is CheckboxSizeS {
            return s
        }
        return nil
    }
}
