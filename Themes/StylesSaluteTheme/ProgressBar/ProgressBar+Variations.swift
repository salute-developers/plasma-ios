import Foundation
import SDDSComponents

public struct ProgressBar {
    public static var all: [Variation<ProgressBarAppearance>] {
        [
            ProgressBar.default,
            ProgressBar.secondary,
            ProgressBar.accent,
            ProgressBar.gradientAccent,
            ProgressBar.positive,
            ProgressBar.negative,
            ProgressBar.warning
        ].map {
            Variation(
                originalVariation: $0,
                styles: [.init(name: $0.name, appearance: $0.appearance)],
                name: $0.name,
                appearance: $0.appearance
            )
        }
    }
}

extension ProgressBar {    
    public typealias Appearance = ProgressBarAppearance
    
    public static var `default`: AppearanceVariation<ProgressBarAppearance> {
        return .init(
            name: "`default`",
            appearance: .init(
                size: SDDSProgressViewSize(),
                tintFillStyle: .color(ColorToken.surfaceDefaultSolidDefault),
                trackColor: ColorToken.surfaceDefaultTransparentSecondary
            )
        )
    }
    
    public static var secondary: AppearanceVariation<ProgressBarAppearance> {
        return .init(
            name: "secondary",
            appearance: .init(
                size: SDDSProgressViewSize(),
                tintFillStyle: .color(ColorToken.surfaceDefaultSolidTertiary),
                trackColor: ColorToken.surfaceDefaultTransparentSecondary
            )
        )
    }
    
    public static var accent: AppearanceVariation<ProgressBarAppearance> {
        return .init(
            name: "accent",
            appearance: .init(
                size: SDDSProgressViewSize(),
                tintFillStyle: .color(ColorToken.surfaceDefaultAccent),
                trackColor: ColorToken.surfaceDefaultTransparentSecondary
            )
        )
    }
    
    public static var gradientAccent: AppearanceVariation<ProgressBarAppearance> {
        return .init(
            name: "gradientAccent",
            appearance: .init(
                size: SDDSProgressViewSize(),
                tintFillStyle: .gradient(GradientToken.surfaceDefaultGradientMain),
                trackColor: ColorToken.surfaceDefaultTransparentSecondary
            )
        )
    }
    
    public static var positive: AppearanceVariation<ProgressBarAppearance> {
        return .init(
            name: "positive",
            appearance: .init(
                size: SDDSProgressViewSize(),
                tintFillStyle: .color(ColorToken.surfaceDefaultPositive),
                trackColor: ColorToken.surfaceDefaultTransparentSecondary
            )
        )
    }
    
    public static var warning: AppearanceVariation<ProgressBarAppearance> {
        return .init(
            name: "warning",
            appearance: .init(
                size: SDDSProgressViewSize(),
                tintFillStyle: .color(ColorToken.surfaceDefaultWarning),
                trackColor: ColorToken.surfaceDefaultTransparentSecondary
            )
        )
    }
    
    public static var negative: AppearanceVariation<ProgressBarAppearance> {
        return .init(
            name: "negative",
            appearance: .init(
                size: SDDSProgressViewSize(),
                tintFillStyle: .color(ColorToken.surfaceDefaultNegative),
                trackColor: ColorToken.surfaceDefaultTransparentSecondary
            )
        )
    }
}
