import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ToolbarHorizontalTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    var xs: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        xs: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
        self.xs = xs
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
        self.xs = oneSize
    }
    
    func typography(with size: ToolbarSizeConfiguration) -> TypographyToken? {
        if size is ToolbarHorizontalAnySize {
            return l
        }
        if size is ToolbarHorizontalSizeL {
            return l
        }
        if size is ToolbarHorizontalSizeM {
            return m
        }
        if size is ToolbarHorizontalSizeS {
            return s
        }
        if size is ToolbarHorizontalSizeXs {
            return xs
        }
        return l
    }
}
