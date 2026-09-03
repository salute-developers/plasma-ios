// Сгенерировано scripts/integration/generate_integration_project.rb — не править руками.
import SwiftUI
import SDDSThemeCore
import SDDSComponents
import SDDSServTheme

enum IntegrationTheme {
    static let name = "SDDSServTheme"

    static func initialize(onComplete: @escaping () -> Void) {
        SDDSServTheme.Theme.initialize(onComplete: onComplete)
    }

    // Размер вариации выбран генератором из тех, что есть у темы SDDSServTheme.
    static var buttonAppearance: ButtonAppearance {
        SDDSServTheme.BasicButton.m.default.appearance
    }

    static var primaryTextColor: ColorToken {
        ColorToken.textDefaultPrimary
    }
}
