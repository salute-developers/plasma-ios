import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListNumberedItemTypography: GeneralTypographyConfiguration {
    var m: TypographyToken?
    var s: TypographyToken?
    
    init(
        m: TypographyToken? = nil,
        s: TypographyToken? = nil
    ) {
        self.m = m
        self.s = s
    }
    
    init(oneSize: TypographyToken) {
        self.m = oneSize
        self.s = oneSize
    }
    
    func typography(with size: ListItemSizeConfiguration) -> TypographyToken? {
        if size is ListNumberedItemAnySize {
            return m
        }
        if size is ListNumberedItemSizeM {
            return m
        }
        if size is ListNumberedItemSizeS {
            return s
        }
        return m
    }
}
