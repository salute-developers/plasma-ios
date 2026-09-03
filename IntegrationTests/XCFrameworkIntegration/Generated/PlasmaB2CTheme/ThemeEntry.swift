// Сгенерировано scripts/integration/generate_integration_project.rb — не править руками.
import SwiftUI
import SDDSThemeCore
import SDDSComponents
import PlasmaB2CTheme

enum IntegrationTheme {
    static let name = "PlasmaB2CTheme"

    static func initialize(onComplete: @escaping () -> Void) {
        PlasmaB2CTheme.Theme.initialize(onComplete: onComplete)
    }

    static var buttonAppearance: ButtonAppearance {
        PlasmaB2CTheme.BasicButton.l.default.appearance
    }

    static var primaryTextColor: ColorToken {
        ColorToken.textDefaultPrimary
    }
}
