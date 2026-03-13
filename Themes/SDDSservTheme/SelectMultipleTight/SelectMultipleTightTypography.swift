import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SelectMultipleTightTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: SelectSizeConfiguration) -> TypographyToken? {
        if size is SelectMultipleTightAnySize {
            return l
        }
        if size is SelectMultipleTightSizeL {
            return l
        }
        if size is SelectMultipleTightSizeM {
            return m
        }
        if size is SelectMultipleTightSizeS {
            return s
        }
        if size is SelectMultipleTightSizeXl {
            return xl
        }
        if size is SelectMultipleTightSizeXs {
            return xs
        }
        return l
    }
}
