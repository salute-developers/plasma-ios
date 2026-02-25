import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextSkeletonDisplayTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
    }
    
    func typography(with size: SkeletonSizeConfiguration) -> TypographyToken? {
        if size is TextSkeletonDisplayAnySize {
            return l
        }
        if size is TextSkeletonDisplaySizeL {
            return l
        }
        if size is TextSkeletonDisplaySizeM {
            return m
        }
        if size is TextSkeletonDisplaySizeS {
            return s
        }
        return l
    }
}
