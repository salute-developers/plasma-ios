import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ModalTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }
    
    func typography(with size: ModalSizeConfiguration) -> TypographyToken? {
        if size is ModalAnySize {
            return `default`
        }
        if size is ModalSizeDefault {
            return `default`
        }
        return nil
    }
}
