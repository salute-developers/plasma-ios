// Сгенерировано scripts/integration/generate_integration_project.rb — не править руками.
import SwiftUI
import SDDSThemeCore
import SDDSComponents
import PlasmaHomeDSTheme

enum IntegrationTheme {
    static let name = "PlasmaHomeDSTheme"

    static func initialize(onComplete: @escaping () -> Void) {
        PlasmaHomeDSTheme.Theme.initialize(onComplete: onComplete)
    }

    static var buttonAppearance: ButtonAppearance {
        PlasmaHomeDSTheme.BasicButton.l.default.appearance
    }

    static var primaryTextColor: ColorToken {
        ColorToken.textDefaultPrimary
    }
}
