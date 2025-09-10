import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BasicButtonGroupTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    var xs: TypographyToken?
    var xxs: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        xs: TypographyToken? = nil,
        xxs: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
        self.xs = xs
        self.xxs = xxs
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
        self.xs = oneSize
        self.xxs = oneSize
    }
    
    func typography(with size: BasicButtonGroupSizeConfiguration) -> TypographyToken? {
        if size is BasicButtonGroupAnySize {
            return l
        }
        if size is BasicButtonGroupSizeL {
            return l
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
        if size is BasicButtonGroupSizeXxs {
            return xxs
        }
        return nil
    }
}
