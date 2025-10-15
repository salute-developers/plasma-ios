import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CardClearTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }
    
    func typography(with size: CardSizeConfiguration) -> TypographyToken? {
        if size is CardClearAnySize {
            return `default`
        }
        if size is CardClearSizeDefault {
            return `default`
        }
        return `default`
    }
}
