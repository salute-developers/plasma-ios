import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CardTypography: GeneralTypographyConfiguration {
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
        if size is CardAnySize {
            return `default`
        }
        if size is CardSizeDefault {
            return `default`
        }
        return nil
    }
}
