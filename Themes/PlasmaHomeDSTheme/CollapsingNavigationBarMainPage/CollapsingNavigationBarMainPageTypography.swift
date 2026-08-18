import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CollapsingNavigationBarMainPageTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }
    
    func typography(with size: CollapsingNavigationBarSizeConfiguration) -> TypographyToken? {
        if size is CollapsingNavigationBarMainPageAnySize {
            return `default`
        }
        if size is CollapsingNavigationBarMainPageSizeDefault {
            return `default`
        }
        return `default`
    }
}
