import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarIslandTypography: GeneralTypographyConfiguration {
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
        if size is TabBarIslandAnySize {
            return l
        }
        if size is TabBarIslandSizeL {
            return l
        }
        if size is TabBarIslandSizeM {
            return m
        }
        return nil
    }
}
