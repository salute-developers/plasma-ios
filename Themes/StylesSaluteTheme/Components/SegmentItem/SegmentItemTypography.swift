import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SegmentItemTypography: GeneralTypographyConfiguration {
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
        if size is SegmentItemSizeXs {
            return xs
        }
        return nil
    }
}
