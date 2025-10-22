import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NavigationBarMainPageTypography: GeneralTypographyConfiguration {
    var hasBackground: TypographyToken?
    var noBackground: TypographyToken?
    
    init(
        hasBackground: TypographyToken? = nil,
        noBackground: TypographyToken? = nil
    ) {
        self.hasBackground = hasBackground
        self.noBackground = noBackground
    }
    
    init(oneSize: TypographyToken) {
        self.hasBackground = oneSize
        self.noBackground = oneSize
    }
    
    func typography(with size: NavigationBarMainPageSizeConfiguration) -> TypographyToken? {
        if size is NavigationBarMainPageAnySize {
            return hasBackground
        }
        if size is NavigationBarMainPageSizeHasbackground {
            return hasBackground
        }
        if size is NavigationBarMainPageSizeNobackground {
            return noBackground
        }
        return hasBackground
    }
}
