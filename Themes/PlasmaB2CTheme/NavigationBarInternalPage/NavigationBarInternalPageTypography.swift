import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NavigationBarInternalPageTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: NavigationBarInternalPageSizeConfiguration) -> TypographyToken? {
        if size is NavigationBarInternalPageAnySize {
            return hasBackground
        }
        if size is NavigationBarInternalPageSizeHasbackground {
            return hasBackground
        }
        if size is NavigationBarInternalPageSizeNobackground {
            return noBackground
        }
        return hasBackground
    }
}
