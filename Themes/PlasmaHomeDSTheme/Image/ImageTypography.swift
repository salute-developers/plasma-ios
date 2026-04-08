import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ImageTypography: GeneralTypographyConfiguration {
    typealias Size = ImageSizeConfiguration

    var `default`: TypographyToken?

    init(`default`: TypographyToken? = nil) {
        self.default = `default`
    }

    init(oneSize: TypographyToken) {
        self.default = oneSize
    }

    func typography(with size: ImageSizeConfiguration) -> TypographyToken? {
        if size is ImageAnySize {
            return `default`
        }
        return `default`
    }
}
