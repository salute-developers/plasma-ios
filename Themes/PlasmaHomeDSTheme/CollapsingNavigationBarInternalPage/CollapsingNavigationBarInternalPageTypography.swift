import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CollapsingNavigationBarInternalPageTypography: GeneralTypographyConfiguration {
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
        if size is CollapsingNavigationBarInternalPageAnySize {
            return `default`
        }
        if size is CollapsingNavigationBarInternalPageSizeDefault {
            return `default`
        }
        return `default`
    }
}
