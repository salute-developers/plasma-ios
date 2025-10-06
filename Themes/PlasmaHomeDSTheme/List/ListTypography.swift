import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListTypography: GeneralTypographyConfiguration {
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
        if size is ListAnySize {
            return s
        }
        if size is ListSizeS {
            return s
        }
        return s
    }
}
