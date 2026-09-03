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

    // Размер вариации выбран генератором из тех, что есть у темы PlasmaHomeDSTheme.
    static var buttonAppearance: ButtonAppearance {
        PlasmaHomeDSTheme.BasicButton.m.default.appearance
    }

    static var primaryTextColor: ColorToken {
        ColorToken.textDefaultPrimary
    }
}
