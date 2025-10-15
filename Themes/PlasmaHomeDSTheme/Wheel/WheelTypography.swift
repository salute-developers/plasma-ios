import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct WheelTypography: GeneralTypographyConfiguration {
    var h1: TypographyToken?
    
    init(
        h1: TypographyToken? = nil
    ) {
        self.h1 = h1
    }
    
    init(oneSize: TypographyToken) {
        self.h1 = oneSize
    }
    
    func typography(with size: WheelSizeConfiguration) -> TypographyToken? {
        if size is WheelAnySize {
            return h1
        }
        if size is WheelSizeH1 {
            return h1
        }
        return h1
    }
}
