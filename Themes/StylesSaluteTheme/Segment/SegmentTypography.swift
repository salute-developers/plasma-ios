import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SegmentTypography: GeneralTypographyConfiguration {
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
        if size is SegmentSizeXs {
            return xs
        }
        return l
    }
}
