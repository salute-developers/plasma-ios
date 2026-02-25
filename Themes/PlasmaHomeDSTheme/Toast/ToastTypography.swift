import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ToastTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }
    
    func typography(with size: ToastSizeConfiguration) -> TypographyToken? {
        if size is ToastAnySize {
            return `default`
        }
        if size is ToastSizeDefault {
            return `default`
        }
        return `default`
    }
}
