import Foundation
import SwiftUI
import SDDSServTheme
import SDDSComponents

extension ChipAppearance {
    static var `default`: ChipAppearance {
        .init(
            titleColor: ColorToken.textInversePrimary,
            titleTypography: Typographies.bodyLNormal.typography,
            imageTintColor: ColorToken.textInversePrimary,
            buttonTintColor: ColorToken.backgroundDarkPrimary,
            disabledAlpha: 0.5
        )
    }
}
