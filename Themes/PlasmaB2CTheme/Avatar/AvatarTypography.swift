import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AvatarTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    var xxl: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        xxl: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
        self.xxl = xxl
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
        self.xxl = oneSize
    }
    
    func typography(with size: AvatarSizeConfiguration) -> TypographyToken? {
        if size is AvatarAnySize {
            return l
        }
        if size is AvatarSizeL {
            return l
        }
        if size is AvatarSizeM {
            return m
        }
        if size is AvatarSizeS {
            return s
        }
        if size is AvatarSizeXxl {
            return xxl
        }
        return l
    }
}
