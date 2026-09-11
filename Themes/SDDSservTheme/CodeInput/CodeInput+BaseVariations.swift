import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct CodeInput {
    public static var l: ComponentAppearanceVariation<CodeInput, CodeInputAppearance> {
        var appearance = CodeInputAppearance.base
        appearance.size = CodeInputSize.l
        appearance.captionTypography = CodeInputTypography(oneSize: AdaptiveTypographyToken.headerH3Normal.typography).asContainer
        appearance.codeTypography = CodeInputTypography(oneSize: AdaptiveTypographyToken.displayLBold.typography).asContainer

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<CodeInput, CodeInputAppearance> {
        var appearance = CodeInputAppearance.base
        appearance.size = CodeInputSize.m
        appearance.captionTypography = CodeInputTypography(oneSize: AdaptiveTypographyToken.headerH4Normal.typography).asContainer
        appearance.codeTypography = CodeInputTypography(oneSize: AdaptiveTypographyToken.displayMBold.typography).asContainer

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<CodeInput, CodeInputAppearance> {
        var appearance = CodeInputAppearance.base
        appearance.size = CodeInputSize.s
        appearance.captionTypography = CodeInputTypography(oneSize: AdaptiveTypographyToken.headerH5Normal.typography).asContainer
        appearance.codeTypography = CodeInputTypography(oneSize: AdaptiveTypographyToken.displaySBold.typography).asContainer

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static var all: [Variation<CodeInputAppearance>] {
        [
            CodeInput.l.variation,
            CodeInput.m.variation,
            CodeInput.s.variation,
        ]
    }
}

public struct CodeInputVariation {
    public struct L {}
    public struct M {}
    public struct S {}
}

private extension CodeInputAppearance {
    static var base: CodeInputAppearance {
        var appearance = CodeInputAppearance()
        appearance.captionColor = StatefulFillStyle(defaultValue: .color(.textDefaultSecondary), values: [
            .init(states: [InteractiveState.error], value: .color(.textDefaultNegative))
        ])
        appearance.codeColor = StatefulFillStyle(defaultValue: .color(.textDefaultPrimary), values: [
            .init(states: [InteractiveState.error], value: .color(.textDefaultNegative))
        ])
        appearance.fillColor = StatefulFillStyle(defaultValue: .color(.surfaceDefaultSolidDefault), values: [
            .init(states: [InteractiveState.error], value: .color(.surfaceDefaultNegative))
        ])
        appearance.strokeColor = StatefulFillStyle(defaultValue: .color(.outlineDefaultSolidDefault), values: [
            .init(states: [InteractiveState.error], value: .color(.outlineDefaultNegative)),
            .init(states: [InteractiveState.focused], value: .color(.outlineDefaultAccent))
        ])
        return appearance
    }
}
