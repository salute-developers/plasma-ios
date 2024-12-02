import Foundation
import SDDSComponents
import SDDSServTheme

public extension AppearanceVariation<ChipAppearance> {
    var accent: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSChip.accent.appearance)
        )
    }
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSChip.default.appearance)
        )
    }
    var negative: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSChip.negative.appearance)
        )
    }
    var positive: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSChip.positive.appearance)
        )
    }
    var secondary: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSChip.secondary.appearance)
        )
    }
    var warning: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSChip.warning.appearance)
        )
    }
}

public extension SDDSChip {
    static var accent: AppearanceVariation<ChipAppearance> {
        .init(
            name: "accent",
            appearance: .init(
                titleColor: ColorToken.textOnDarkPrimary,
                titleTypography: ChipTypography.title,
                imageTintColor: ColorToken.textOnDarkPrimary,
                buttonTintColor: ColorToken.textOnDarkPrimary,
                backgroundColor: ColorToken.surfaceDefaultAccent,
                disabledAlpha: 0.4
            )
        )
    }
    
    static var `default`: AppearanceVariation<ChipAppearance> {
        .init(
            name: "default",
            appearance: .init(
                titleColor: ColorToken.textInversePrimary,
                titleTypography: ChipTypography.title,
                imageTintColor: ColorToken.textInversePrimary,
                buttonTintColor: ColorToken.textInversePrimary,
                backgroundColor: ColorToken.surfaceDefaultSolidDefault,
                disabledAlpha: 0.4
            )
        )
    }
    
    static var negative: AppearanceVariation<ChipAppearance> {
        .init(
            name: "negative",
            appearance: .init(
                titleColor: ColorToken.textOnDarkPrimary,
                titleTypography: ChipTypography.title,
                imageTintColor: ColorToken.textOnDarkPrimary,
                buttonTintColor: ColorToken.textOnDarkPrimary,
                backgroundColor: ColorToken.surfaceDefaultNegative,
                disabledAlpha: 0.4
            )
        )
    }
    
    static var positive: AppearanceVariation<ChipAppearance> {
        .init(
            name: "positive",
            appearance: .init(
                titleColor: ColorToken.textOnDarkPrimary,
                titleTypography: ChipTypography.title,
                imageTintColor: ColorToken.textOnDarkPrimary,
                buttonTintColor: ColorToken.textOnDarkPrimary,
                backgroundColor: ColorToken.surfaceDefaultPositive,
                disabledAlpha: 0.4
            )
        )
    }
    
    static var secondary: AppearanceVariation<ChipAppearance> {
        .init(
            name: "secondary",
            appearance: .init(
                titleColor: ColorToken.textDefaultPrimary,
                titleTypography: ChipTypography.title,
                imageTintColor: ColorToken.textDefaultPrimary,
                buttonTintColor: ColorToken.textDefaultPrimary,
                backgroundColor: ColorToken.surfaceDefaultTransparentSecondary,
                disabledAlpha: 0.4
            )
        )
    }
    
    static var warning: AppearanceVariation<ChipAppearance> {
        .init(
            name: "warning",
            appearance: .init(
                titleColor: ColorToken.textOnDarkPrimary,
                titleTypography: ChipTypography.title,
                imageTintColor: ColorToken.textOnDarkPrimary,
                buttonTintColor: ColorToken.textOnDarkPrimary,
                backgroundColor: ColorToken.surfaceDefaultWarning,
                disabledAlpha: 0.4
            )
        )
    }
    
    static var all: [AppearanceVariation<ChipAppearance>] {
        [
            
            SDDSChip.accent,
            
            SDDSChip.`default`,
            
            SDDSChip.negative,
            
            SDDSChip.positive,
            
            SDDSChip.secondary,
            
            SDDSChip.warning
            
        ]
    }
}
