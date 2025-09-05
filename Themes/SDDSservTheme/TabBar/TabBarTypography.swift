import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarTypography: GeneralTypographyConfiguration {
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
        if size is TabBarAnySize {
            return l
        }
        if size is TabBarSizeL {
            return l
        }
        if size is TabBarSizeM {
            return m
        }
        return nil
    }
}
