import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BottomSheetTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }
    
    func typography(with size: BottomSheetSizeConfiguration) -> TypographyToken? {
        if size is BottomSheetAnySize {
            return `default`
        }
        if size is BottomSheetSizeDefault {
            return `default`
        }
        return `default`
    }
}
