import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarIslandHasLabelClearTypography: GeneralTypographyConfiguration {
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
        if size is TabBarIslandHasLabelClearAnySize {
            return l
        }
        if size is TabBarIslandHasLabelClearSizeL {
            return l
        }
        if size is TabBarIslandHasLabelClearSizeM {
            return m
        }
        return nil
    }
}
