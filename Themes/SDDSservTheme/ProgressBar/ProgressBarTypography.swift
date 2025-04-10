import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ProgressBarTypography: GeneralTypographyConfiguration {
    
    init(
    ) {
    }
    
    init(oneSize: TypographyToken) {
    }
    
    func typography(with size: ProgressBarSizeConfiguration) -> TypographyToken? {
        if size is ProgressBarAnySize {
        }
        return nil
    }
}
