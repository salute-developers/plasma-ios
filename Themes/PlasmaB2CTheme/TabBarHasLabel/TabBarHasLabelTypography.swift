import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarHasLabelTypography: GeneralTypographyConfiguration {
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
        if size is TabBarHasLabelAnySize {
            return l
        }
        if size is TabBarHasLabelSizeL {
            return l
        }
        if size is TabBarHasLabelSizeM {
            return m
        }
        return l
    }
}
