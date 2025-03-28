import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CardClearTypography: GeneralTypographyConfiguration {
    
    init(
    ) {
    }
    
    init(oneSize: TypographyToken) {
    }
    
    func typography(with size: CardSizeConfiguration) -> TypographyToken? {
        if size is CardClearAnySize {
        }
        return nil
    }
}
