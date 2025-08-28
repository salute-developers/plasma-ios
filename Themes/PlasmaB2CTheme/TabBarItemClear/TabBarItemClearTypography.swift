import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarItemClearTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: TabBarItemSizeConfiguration) -> TypographyToken? {
        if size is TabBarItemClearAnySize {
            return l
        }
        if size is TabBarItemClearSizeL {
            return l
        }
        if size is TabBarItemClearSizeM {
            return m
        }
        return nil
    }
}
