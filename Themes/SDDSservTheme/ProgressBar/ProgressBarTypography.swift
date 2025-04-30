import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ProgressBarTypography: GeneralTypographyConfiguration {
    var Default: TypographyToken?
    
    init(
        Default: TypographyToken? = nil
    ) {
        self.Default = Default
    }
    
    init(oneSize: TypographyToken) {
        self.Default = oneSize
    }
    
    func typography(with size: ProgressBarSizeConfiguration) -> TypographyToken? {
        if size is ProgressBarAnySize {
            return Default
        }
        if size is ProgressBarSizeDefault {
            return Default
        }
        return nil
    }
}
