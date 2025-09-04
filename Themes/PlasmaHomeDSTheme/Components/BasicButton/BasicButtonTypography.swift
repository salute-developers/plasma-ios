import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BasicButtonTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: ButtonSizeConfiguration) -> TypographyToken? {
        if size is BasicButtonAnySize {
            return m
        }
        if size is BasicButtonSizeM {
            return m
        }
        if size is BasicButtonSizeS {
            return s
        }
        return nil
    }
}
