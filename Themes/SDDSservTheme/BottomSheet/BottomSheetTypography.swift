import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BottomSheetTypography: GeneralTypographyConfiguration {
    
    init(
    ) {
    }
    
    init(oneSize: TypographyToken) {
    }
    
    func typography(with size: BottomSheetSizeConfiguration) -> TypographyToken? {
        if size is BottomSheetAnySize {
        }
        return nil
    }
}
