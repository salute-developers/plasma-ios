import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct LoaderTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }
    
    func typography(with size: LoaderSizeConfiguration) -> TypographyToken? {
        if size is LoaderAnySize {
            return `default`
        }
        if size is LoaderSizeDefault {
            return `default`
        }
        return nil
    }
}
