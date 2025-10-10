import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarSolidTypography: GeneralTypographyConfiguration {
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
        if size is TabBarSolidAnySize {
            return l
        }
        if size is TabBarSolidSizeL {
            return l
        }
        if size is TabBarSolidSizeM {
            return m
        }
        return l
    }
}
