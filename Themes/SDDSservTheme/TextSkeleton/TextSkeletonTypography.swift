import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextSkeletonTypography: GeneralTypographyConfiguration {
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
        if size is TextSkeletonAnySize {
            return `default`
        }
        if size is TextSkeletonSizeDefault {
            return `default`
        }
        return `default`
    }
}
