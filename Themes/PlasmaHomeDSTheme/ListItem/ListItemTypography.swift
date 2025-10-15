import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListItemTypography: GeneralTypographyConfiguration {
    var s: TypographyToken?
    
    init(
        s: TypographyToken? = nil
    ) {
        self.s = s
    }
    
    init(oneSize: TypographyToken) {
        self.s = oneSize
    }
    
    func typography(with size: ListItemSizeConfiguration) -> TypographyToken? {
        if size is ListItemAnySize {
            return s
        }
        if size is ListItemSizeS {
            return s
        }
        return s
    }
}
