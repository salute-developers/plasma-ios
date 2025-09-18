import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }
    
    func typography(with size: TabBarSizeConfiguration) -> TypographyToken? {
        if size is TabBarAnySize {
            return `default`
        }
        if size is TabBarSizeDefault {
            return `default`
        }
        return nil
    }
}
