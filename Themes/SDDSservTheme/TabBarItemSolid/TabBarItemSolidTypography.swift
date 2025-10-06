import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarItemSolidTypography: GeneralTypographyConfiguration {
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
        if size is TabBarItemSolidAnySize {
            return l
        }
        if size is TabBarItemSolidSizeL {
            return l
        }
        if size is TabBarItemSolidSizeM {
            return m
        }
        return l
    }
}
