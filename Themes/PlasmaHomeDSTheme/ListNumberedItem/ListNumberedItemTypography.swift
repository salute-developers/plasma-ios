import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListNumberedItemTypography: GeneralTypographyConfiguration {
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
        if size is ListNumberedItemAnySize {
            return s
        }
        if size is ListNumberedItemSizeS {
            return s
        }
        return s
    }
}
