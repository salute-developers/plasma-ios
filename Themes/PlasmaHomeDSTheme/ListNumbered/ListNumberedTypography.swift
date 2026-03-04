import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListNumberedTypography: GeneralTypographyConfiguration {
    var s: TypographyToken?
    
    init(
        s: TypographyToken? = nil
    ) {
        self.s = s
    }
    
    init(oneSize: TypographyToken) {
        self.s = oneSize
    }
    
    func typography(with size: ListSizeConfiguration) -> TypographyToken? {
        if size is ListNumberedAnySize {
            return s
        }
        if size is ListNumberedSizeS {
            return s
        }
        return s
    }
}
