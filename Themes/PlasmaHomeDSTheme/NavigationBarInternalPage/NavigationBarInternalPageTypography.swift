import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NavigationBarInternalPageTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }
    
    func typography(with size: NavigationBarInternalPageSizeConfiguration) -> TypographyToken? {
        if size is NavigationBarInternalPageAnySize {
            return `default`
        }
        if size is NavigationBarInternalPageSizeDefault {
            return `default`
        }
        return `default`
    }
}
