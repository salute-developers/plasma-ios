import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NotificationLooseTypography: GeneralTypographyConfiguration {
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
        if size is NotificationLooseAnySize {
            return l
        }
        if size is NotificationLooseSizeL {
            return l
        }
        if size is NotificationLooseSizeM {
            return m
        }
        if size is NotificationLooseSizeS {
            return s
        }
        return nil
    }
}
