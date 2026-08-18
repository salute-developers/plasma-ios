import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListItemTypography: GeneralTypographyConfiguration {
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
        if size is ListItemAnySize {
            return m
        }
        if size is ListItemSizeM {
            return m
        }
        if size is ListItemSizeS {
            return s
        }
        return m
    }
}
