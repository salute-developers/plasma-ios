import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct WheelTypography: GeneralTypographyConfiguration {
    var h1: TypographyToken?
    var h4: TypographyToken?
    
    init(
        h1: TypographyToken? = nil,
        h4: TypographyToken? = nil
    ) {
        self.h1 = h1
        self.h4 = h4
    }
    
    init(oneSize: TypographyToken) {
        self.h1 = oneSize
        self.h4 = oneSize
    }
    
    func typography(with size: WheelSizeConfiguration) -> TypographyToken? {
        if size is WheelAnySize {
            return h1
        }
        if size is WheelSizeH1 {
            return h1
        }
        if size is WheelSizeH4 {
            return h4
        }
        return h1
    }
}
