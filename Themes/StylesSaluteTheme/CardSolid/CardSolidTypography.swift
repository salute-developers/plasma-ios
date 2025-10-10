import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CardSolidTypography: GeneralTypographyConfiguration {
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
        if size is CardSolidAnySize {
            return `default`
        }
        if size is CardSolidSizeDefault {
            return `default`
        }
        return `default`
    }
}
