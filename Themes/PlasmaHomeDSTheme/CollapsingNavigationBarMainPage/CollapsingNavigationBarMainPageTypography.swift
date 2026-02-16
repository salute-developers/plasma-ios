import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CollapsingNavigationBarTypography: GeneralTypographyConfiguration {
    typealias Size = CollapsingNavigationBarSizeConfiguration

    var `default`: TypographyToken?

    init(
        `default`: TypographyToken? = nil
    ) {
        self.`default` = `default`
    }

    init(oneSize: TypographyToken) {
        self.`default` = oneSize
    }

    func typography(with size: CollapsingNavigationBarSizeConfiguration) -> TypographyToken? {
        `default`
    }
}
