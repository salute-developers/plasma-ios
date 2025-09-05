import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SegmentTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: SegmentSizeConfiguration) -> TypographyToken? {
        if size is SegmentAnySize {
            return l
        }
        if size is SegmentSizeL {
            return l
        }
        if size is SegmentSizeM {
            return m
        }
        if size is SegmentSizeS {
            return s
        }
        if size is SegmentSizeXl {
            return xl
        }
        if size is SegmentSizeXs {
            return xs
        }
        return nil
    }
}
