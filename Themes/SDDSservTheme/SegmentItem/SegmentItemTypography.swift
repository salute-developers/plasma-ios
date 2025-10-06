import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SegmentItemTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: SegmentItemSizeConfiguration) -> TypographyToken? {
        if size is SegmentItemAnySize {
            return l
        }
        if size is SegmentItemSizeL {
            return l
        }
        if size is SegmentItemSizeM {
            return m
        }
        if size is SegmentItemSizeS {
            return s
        }
        if size is SegmentItemSizeXl {
            return xl
        }
        if size is SegmentItemSizeXs {
            return xs
        }
        return l
    }
}
