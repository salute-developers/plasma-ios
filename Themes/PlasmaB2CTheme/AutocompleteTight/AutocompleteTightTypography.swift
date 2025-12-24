import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AutocompleteTightTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: AutocompleteSizeConfiguration) -> TypographyToken? {
        if size is AutocompleteTightAnySize {
            return l
        }
        if size is AutocompleteTightSizeL {
            return l
        }
        if size is AutocompleteTightSizeM {
            return m
        }
        if size is AutocompleteTightSizeS {
            return s
        }
        if size is AutocompleteTightSizeXl {
            return xl
        }
        if size is AutocompleteTightSizeXs {
            return xs
        }
        return l
    }
}
