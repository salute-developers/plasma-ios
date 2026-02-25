import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextSkeletonTextTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: SkeletonSizeConfiguration) -> TypographyToken? {
        if size is TextSkeletonTextAnySize {
            return l
        }
        if size is TextSkeletonTextSizeL {
            return l
        }
        if size is TextSkeletonTextSizeM {
            return m
        }
        if size is TextSkeletonTextSizeS {
            return s
        }
        if size is TextSkeletonTextSizeXs {
            return xs
        }
        return l
    }
}
