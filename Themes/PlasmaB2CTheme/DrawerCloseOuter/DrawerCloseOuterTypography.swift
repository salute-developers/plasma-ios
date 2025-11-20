import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DrawerCloseOuterTypography: GeneralTypographyConfiguration {
    var m: TypographyToken?
    
    init(
        m: TypographyToken? = nil
    ) {
        self.m = m
    }
    
    init(oneSize: TypographyToken) {
        self.m = oneSize
    }
    
    func typography(with size: DrawerSizeConfiguration) -> TypographyToken? {
        if size is DrawerCloseOuterAnySize {
            return m
        }
        if size is DrawerCloseOuterSizeM {
            return m
        }
        return m
    }
}
