import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarClearTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
    }
    
    func typography(with size: TabBarSizeConfiguration) -> TypographyToken? {
        if size is TabBarClearAnySize {
            return l
        }
        if size is TabBarClearSizeL {
            return l
        }
        if size is TabBarClearSizeM {
            return m
        }
        return l
    }
}
