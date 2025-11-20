import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DrawerCloseNoneTypography: GeneralTypographyConfiguration {
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
        if size is DrawerCloseNoneAnySize {
            return m
        }
        if size is DrawerCloseNoneSizeM {
            return m
        }
        return m
    }
}
