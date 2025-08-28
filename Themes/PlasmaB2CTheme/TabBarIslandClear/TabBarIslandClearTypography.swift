import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarIslandClearTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: TabBarIslandSizeConfiguration) -> TypographyToken? {
        if size is TabBarIslandClearAnySize {
            return l
        }
        if size is TabBarIslandClearSizeL {
            return l
        }
        if size is TabBarIslandClearSizeM {
            return m
        }
        return nil
    }
}
