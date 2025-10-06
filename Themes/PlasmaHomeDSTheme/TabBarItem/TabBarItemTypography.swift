import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarItemTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }
    
    func typography(with size: TabBarItemSizeConfiguration) -> TypographyToken? {
        if size is TabBarItemAnySize {
            return `default`
        }
        if size is TabBarItemSizeDefault {
            return `default`
        }
        return `default`
    }
}
