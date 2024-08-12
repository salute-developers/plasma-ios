import Foundation
import SwiftUI
import SDDSServTheme
import SDDSComponents

extension ChipAppearance {
    static var `default`: ChipAppearance {
        .init(
            titleColor: Color.white.equalToken,
            titleTypography: .semibold14,
            imageTintColor: Color.white.equalToken,
            buttonTintColor: Color.gray.equalToken,
            disabledAlpha: 0.5
        )
    }
}
