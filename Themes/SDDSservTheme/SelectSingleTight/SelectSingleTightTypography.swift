import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SelectSingleTightTypography: GeneralTypographyConfiguration {
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
        if size is SelectSingleTightAnySize {
            return l
        }
        if size is SelectSingleTightSizeL {
            return l
        }
        if size is SelectSingleTightSizeM {
            return m
        }
        if size is SelectSingleTightSizeS {
            return s
        }
        if size is SelectSingleTightSizeXl {
            return xl
        }
        if size is SelectSingleTightSizeXs {
            return xs
        }
        return l
    }
}
