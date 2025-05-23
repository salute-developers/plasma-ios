import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct OverlayTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }
    
    func typography(with size: OverlaySizeConfiguration) -> TypographyToken? {
        if size is OverlayAnySize {
            return `default`
        }
        if size is OverlaySizeDefault {
            return `default`
        }
        return nil
    }
}
