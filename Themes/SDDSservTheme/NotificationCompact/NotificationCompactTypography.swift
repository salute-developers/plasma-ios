import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NotificationCompactTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
    }
    
    func typography(with size: NotificationSizeConfiguration) -> TypographyToken? {
        if size is NotificationCompactAnySize {
            return l
        }
        if size is NotificationCompactSizeL {
            return l
        }
        if size is NotificationCompactSizeM {
            return m
        }
        if size is NotificationCompactSizeS {
            return s
        }
        return l
    }
}
