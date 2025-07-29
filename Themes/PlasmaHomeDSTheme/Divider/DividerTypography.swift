import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DividerTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }
    
    func typography(with size: DividerSizeConfiguration) -> TypographyToken? {
        if size is DividerAnySize {
            return `default`
        }
        if size is DividerSizeDefault {
            return `default`
        }
        return nil
    }
}
