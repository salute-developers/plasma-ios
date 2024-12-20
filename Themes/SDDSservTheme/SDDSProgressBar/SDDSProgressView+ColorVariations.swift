import Foundation
import SDDSComponents
import SDDSServTheme

public extension AppearanceVariation<ProgressBarAppearance> {
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSProgressView.default.appearance)
        )
    }
    
    var secondary: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSProgressView.secondary.appearance)
        )
    }
    
    var accent: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSProgressView.accent.appearance)
        )
    }
    
    var gradientAccent: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSProgressView.gradientAccent.appearance)
        )
    }
    
    var positive: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSProgressView.positive.appearance)
        )
    }
    
    var warning: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSProgressView.warning.appearance)
        )
    }
    
    var negative: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSProgressView.negative.appearance)
        )
    }
    
    var info: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSProgressView.info.appearance)
        )
    }
}

public extension SDDSProgressView {
    static var `default`: AppearanceVariation<ProgressBarAppearance> {
        .init(
            name: "default",
            appearance:
                .init(
                    size: SDDSProgressViewSize(),
                    tintFillStyle: .color(ColorToken.surfaceDefaultSolidPrimary),
                    trackColor: ColorToken.surfaceDefaultTransparentSecondary
                )
        )
    }
    
    static var secondary: AppearanceVariation<ProgressBarAppearance> {
        .init(
            name: "secondary",
            appearance:
                .init(
                    size: SDDSProgressViewSize(),
                    tintFillStyle: .color(ColorToken.surfaceDefaultSolidSecondary),
                    trackColor: ColorToken.surfaceDefaultTransparentSecondary
                )
        )
    }
    
    static var accent: AppearanceVariation<ProgressBarAppearance> {
        .init(
            name: "accent",
            appearance:
                .init(
                    size: SDDSProgressViewSize(),
                    tintFillStyle: .color(ColorToken.surfaceDefaultAccent),
                    trackColor: ColorToken.surfaceDefaultTransparentSecondary
                )
        )
    }
    
    static var gradientAccent: AppearanceVariation<ProgressBarAppearance> {
        .init(
            name: "gradientAccent",
            appearance:
                .init(
                    size: SDDSProgressViewSize(),
                    tintFillStyle: .gradient(GradientToken.surfaceDefaultAccentGradient),
                    trackColor: ColorToken.surfaceDefaultTransparentSecondary
                )
        )
    }
    
    static var positive: AppearanceVariation<ProgressBarAppearance> {
        .init(
            name: "positive",
            appearance:
                .init(
                    size: SDDSProgressViewSize(),
                    tintFillStyle: .color(ColorToken.surfaceDefaultPositive),
                    trackColor: ColorToken.surfaceDefaultTransparentSecondary
                )
        )
    }
    
    static var warning: AppearanceVariation<ProgressBarAppearance> {
        .init(
            name: "warning",
            appearance:
                .init(
                    size: SDDSProgressViewSize(),
                    tintFillStyle: .color(ColorToken.surfaceDefaultWarning),
                    trackColor: ColorToken.surfaceDefaultTransparentSecondary
                )
        )
    }
    
    static var negative: AppearanceVariation<ProgressBarAppearance> {
        .init(
            name: "negative",
            appearance:
                .init(
                    size: SDDSProgressViewSize(),
                    tintFillStyle: .color(ColorToken.surfaceDefaultNegative),
                    trackColor: ColorToken.surfaceDefaultTransparentSecondary
                )
        )
    }
    
    static var info: AppearanceVariation<ProgressBarAppearance> {
        .init(
            name: "info",
            appearance:
                .init(
                    size: SDDSProgressViewSize(),
                    tintFillStyle: .color(ColorToken.surfaceDefaultInfo),
                    trackColor: ColorToken.surfaceDefaultTransparentSecondary
                )
        )
    }
    
    static var all: [AppearanceVariation<ProgressBarAppearance>] {
        [
            SDDSProgressView.default,
            SDDSProgressView.accent,
            SDDSProgressView.secondary,
            SDDSProgressView.gradientAccent,
            SDDSProgressView.positive,
            SDDSProgressView.warning,
            SDDSProgressView.negative,
            SDDSProgressView.info
        ]
    }
}
