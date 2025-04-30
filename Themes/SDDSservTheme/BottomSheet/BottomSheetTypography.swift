import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BottomSheetTypography: GeneralTypographyConfiguration {
    var Default: TypographyToken?
    
    init(
        Default: TypographyToken? = nil
    ) {
        self.Default = Default
    }
    
    init(oneSize: TypographyToken) {
        self.Default = oneSize
    }
    
    func typography(with size: BottomSheetSizeConfiguration) -> TypographyToken? {
        if size is BottomSheetAnySize {
            return Default
        }
        if size is BottomSheetSizeDefault {
            return Default
        }
        return nil
    }
}
