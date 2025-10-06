import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BasicButtonGroupTypography: GeneralTypographyConfiguration {
    var m: TypographyToken?
    var s: TypographyToken?
    var xs: TypographyToken?
    
    init(
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        xs: TypographyToken? = nil
    ) {
        self.m = m
        self.s = s
        self.xs = xs
    }
    
    init(oneSize: TypographyToken) {
        self.m = oneSize
        self.s = oneSize
        self.xs = oneSize
    }
    
    func typography(with size: ButtonGroupSizeConfiguration) -> TypographyToken? {
        if size is BasicButtonGroupAnySize {
            return m
        }
        if size is BasicButtonGroupSizeM {
            return m
        }
        if size is BasicButtonGroupSizeS {
            return s
        }
        if size is BasicButtonGroupSizeXs {
            return xs
        }
        return m
    }
}
