import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarHasLabelClearTypography: GeneralTypographyConfiguration {
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
        if size is TabBarHasLabelClearAnySize {
            return l
        }
        if size is TabBarHasLabelClearSizeL {
            return l
        }
        if size is TabBarHasLabelClearSizeM {
            return m
        }
        return nil
    }
}
