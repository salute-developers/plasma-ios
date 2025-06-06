import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct Modal {
    public static var `default`: ComponentAppearanceVariation<Modal, ModalAppearance> {
        var appearance = ModalAppearance.base
        appearance.size = ModalSize.`default`
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        appearance.closeColor = ColorToken.textDefaultSecondary

        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<ModalAppearance>] = [
        Modal.default.variation,
    ]
}

public struct ModalVariation {
    public struct Default {}
}

private extension ModalAppearance {
    static var base: ModalAppearance {
        var appearance = ModalAppearance()
        appearance.backgroundColor = ColorToken.surfaceDefaultSolidCard
        appearance.closeColor = ColorToken.textDefaultSecondary
        return appearance
    }
}
