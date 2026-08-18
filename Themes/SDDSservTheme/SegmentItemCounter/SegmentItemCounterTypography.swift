import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SegmentItemCounterTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    var xs: TypographyToken?
    var xxs: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        xs: TypographyToken? = nil,
        xxs: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
        self.xs = xs
        self.xxs = xxs
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
        self.xs = oneSize
        self.xxs = oneSize
    }
    
    func typography(with size: CounterSizeConfiguration) -> TypographyToken? {
        if size is SegmentItemCounterAnySize {
            return l
        }
        if size is SegmentItemCounterSizeL {
            return l
        }
        if size is SegmentItemCounterSizeM {
            return m
        }
        if size is SegmentItemCounterSizeS {
            return s
        }
        if size is SegmentItemCounterSizeXs {
            return xs
        }
        if size is SegmentItemCounterSizeXxs {
            return xxs
        }
        return l
    }
}
