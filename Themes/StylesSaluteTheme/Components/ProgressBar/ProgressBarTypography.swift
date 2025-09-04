import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ProgressBarTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }
    
    func typography(with size: ProgressBarSizeConfiguration) -> TypographyToken? {
        if size is ProgressBarAnySize {
            return `default`
        }
        if size is ProgressBarSizeDefault {
            return `default`
        }
        return nil
    }
}
