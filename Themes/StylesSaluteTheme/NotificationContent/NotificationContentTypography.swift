import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NotificationContentTypography: GeneralTypographyConfiguration {
    var buttonStretch: TypographyToken?
    var noButtonStretch: TypographyToken?
    
    init(
        buttonStretch: TypographyToken? = nil,
        noButtonStretch: TypographyToken? = nil
    ) {
        self.buttonStretch = buttonStretch
        self.noButtonStretch = noButtonStretch
    }
    
    init(oneSize: TypographyToken) {
        self.buttonStretch = oneSize
        self.noButtonStretch = oneSize
    }
    
    func typography(with size: NotificationContentSizeConfiguration) -> TypographyToken? {
        if size is NotificationContentAnySize {
            return buttonStretch
        }
        if size is NotificationContentSizeButtonstretch {
            return buttonStretch
        }
        if size is NotificationContentSizeNobuttonstretch {
            return noButtonStretch
        }
        return nil
    }
}
