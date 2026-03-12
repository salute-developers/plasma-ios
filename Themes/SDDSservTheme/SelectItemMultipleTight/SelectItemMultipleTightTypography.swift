import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SelectItemMultipleTightTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: SelectItemSizeConfiguration) -> TypographyToken? {
        if size is SelectItemMultipleTightAnySize {
            return l
        }
        if size is SelectItemMultipleTightSizeL {
            return l
        }
        if size is SelectItemMultipleTightSizeM {
            return m
        }
        if size is SelectItemMultipleTightSizeS {
            return s
        }
        if size is SelectItemMultipleTightSizeXl {
            return xl
        }
        if size is SelectItemMultipleTightSizeXs {
            return xs
        }
        return l
    }
}
