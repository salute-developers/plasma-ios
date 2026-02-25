import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextSkeletonBodyTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: SkeletonSizeConfiguration) -> TypographyToken? {
        if size is TextSkeletonBodyAnySize {
            return l
        }
        if size is TextSkeletonBodySizeL {
            return l
        }
        if size is TextSkeletonBodySizeM {
            return m
        }
        if size is TextSkeletonBodySizeS {
            return s
        }
        if size is TextSkeletonBodySizeXs {
            return xs
        }
        if size is TextSkeletonBodySizeXxs {
            return xxs
        }
        return l
    }
}
