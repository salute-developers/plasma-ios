import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarIslandHasLabelTypography: GeneralTypographyConfiguration {
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
        if size is TabBarIslandHasLabelAnySize {
            return l
        }
        if size is TabBarIslandHasLabelSizeL {
            return l
        }
        if size is TabBarIslandHasLabelSizeM {
            return m
        }
        return nil
    }
}
