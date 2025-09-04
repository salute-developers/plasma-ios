import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct RectSkeletonTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }
    
    func typography(with size: SkeletonSizeConfiguration) -> TypographyToken? {
        if size is RectSkeletonAnySize {
            return `default`
        }
        if size is RectSkeletonSizeDefault {
            return `default`
        }
        return nil
    }
}
