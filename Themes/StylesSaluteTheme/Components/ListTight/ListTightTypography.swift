import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListTightTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    var xl: TypographyToken?
    var xs: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        xl: TypographyToken? = nil,
        xs: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
        self.xl = xl
        self.xs = xs
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
        self.xl = oneSize
        self.xs = oneSize
    }
    
    func typography(with size: ListSizeConfiguration) -> TypographyToken? {
        if size is ListTightAnySize {
            return l
        }
        if size is ListTightSizeL {
            return l
        }
        if size is ListTightSizeM {
            return m
        }
        if size is ListTightSizeS {
            return s
        }
        if size is ListTightSizeXl {
            return xl
        }
        if size is ListTightSizeXs {
            return xs
        }
        return nil
    }
}
