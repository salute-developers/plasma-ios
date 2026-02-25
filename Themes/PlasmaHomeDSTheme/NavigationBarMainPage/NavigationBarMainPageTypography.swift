import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NavigationBarMainPageTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }
    
    func typography(with size: NavigationBarMainPageSizeConfiguration) -> TypographyToken? {
        if size is NavigationBarMainPageAnySize {
            return `default`
        }
        if size is NavigationBarMainPageSizeDefault {
            return `default`
        }
        return `default`
    }
}
