import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct FormItemTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }
    
    func typography(with size: FormItemSizeConfiguration) -> TypographyToken? {
        if size is FormItemAnySize {
            return `default`
        }
        if size is FormItemSizeDefault {
            return `default`
        }
        return `default`
    }
}
