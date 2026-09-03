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

    // Размер вариации выбран генератором из тех, что есть у темы PlasmaB2CTheme.
    static var buttonAppearance: ButtonAppearance {
        PlasmaB2CTheme.BasicButton.m.default.appearance
    }

    static var primaryTextColor: ColorToken {
        ColorToken.textDefaultPrimary
    }
}
