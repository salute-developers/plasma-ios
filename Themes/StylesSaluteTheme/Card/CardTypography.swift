import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CardTypography: GeneralTypographyConfiguration {
    
    init(
    ) {
    }
    
    init(oneSize: TypographyToken) {
    }
    
    func typography(with size: CardSizeConfiguration) -> TypographyToken? {
        if size is CardAnySize {
        }
        return nil
    }
}
