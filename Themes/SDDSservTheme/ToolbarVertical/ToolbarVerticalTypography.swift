import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ToolbarVerticalTypography: GeneralTypographyConfiguration {
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
        if size is ToolbarVerticalAnySize {
            return l
        }
        if size is ToolbarVerticalSizeL {
            return l
        }
        if size is ToolbarVerticalSizeM {
            return m
        }
        if size is ToolbarVerticalSizeS {
            return s
        }
        if size is ToolbarVerticalSizeXs {
            return xs
        }
        return l
    }
}
