import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AvatarGroupTypography: GeneralTypographyConfiguration {
    var s: TypographyToken?
    
    init(
        s: TypographyToken? = nil
    ) {
        self.s = s
    }
    
    init(oneSize: TypographyToken) {
        self.s = oneSize
    }
    
    func typography(with size: AvatarGroupSizeConfiguration) -> TypographyToken? {
        if size is AvatarGroupAnySize {
            return s
        }
        if size is AvatarGroupSizeS {
            return s
        }
        return s
    }
}
