import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ToastTypography: GeneralTypographyConfiguration {
    var pilled: TypographyToken?
    var rounded: TypographyToken?
    
    init(
        pilled: TypographyToken? = nil,
        rounded: TypographyToken? = nil
    ) {
        self.pilled = pilled
        self.rounded = rounded
    }
    
    init(oneSize: TypographyToken) {
        self.pilled = oneSize
        self.rounded = oneSize
    }
    
    func typography(with size: ToastSizeConfiguration) -> TypographyToken? {
        if size is ToastAnySize {
            return pilled
        }
        if size is ToastSizePilled {
            return pilled
        }
        if size is ToastSizeRounded {
            return rounded
        }
        return nil
    }
}
