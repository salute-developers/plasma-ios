import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DrawerCloseInnerTypography: GeneralTypographyConfiguration {
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
        if size is DrawerCloseInnerAnySize {
            return m
        }
        if size is DrawerCloseInnerSizeM {
            return m
        }
        return m
    }
}
