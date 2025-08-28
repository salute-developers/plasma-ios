import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarItemTypography: GeneralTypographyConfiguration {
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
        if size is TabBarItemAnySize {
            return l
        }
        if size is TabBarItemSizeL {
            return l
        }
        if size is TabBarItemSizeM {
            return m
        }
        return nil
    }
}
