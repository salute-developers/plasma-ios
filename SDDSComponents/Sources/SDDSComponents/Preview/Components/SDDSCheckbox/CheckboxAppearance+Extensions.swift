import Foundation
import SwiftUI
@_exported import SDDSservTheme


public extension CheckboxAppearance {
    static var `default`: Self {
        .init(
            titleTypography: RadioboxTypography.label,
            subtitleTypography: RadioboxTypography.description,
            titleColor: .backgroundInversePrimary,
            subtitleColor: .surfaceInverseSolidPrimary.withOpacity(0.56),
            disabledAlpha: 0.4,
            imageTintColor: .surfaceDefaultAccent
        )
    }
}
