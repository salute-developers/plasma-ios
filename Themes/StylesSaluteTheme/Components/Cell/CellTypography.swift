import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CellTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: CellSizeConfiguration) -> TypographyToken? {
        if size is CellAnySize {
            return l
        }
        if size is CellSizeL {
            return l
        }
        if size is CellSizeM {
            return m
        }
        if size is CellSizeS {
            return s
        }
        if size is CellSizeXs {
            return xs
        }
        return nil
    }
}
