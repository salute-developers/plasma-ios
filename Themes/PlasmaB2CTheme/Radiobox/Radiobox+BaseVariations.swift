import Foundation
import SDDSComponents
import SDDSThemeCore

public struct Radiobox {
    public static var m: ComponentAppearanceVariation<Radiobox, RadioboxAppearance> {
        var appearance = RadioboxAppearance.base
        appearance.size = SDDSRadioboxSize.medium
        appearance.titleTypography = RadioboxTypography.label
        appearance.subtitleTypography = RadioboxTypography.description
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static var s: ComponentAppearanceVariation<Radiobox, RadioboxAppearance> {
        var appearance = RadioboxAppearance.base
        appearance.size = SDDSRadioboxSize.small
        appearance.titleTypography = RadioboxTypography.label
        appearance.subtitleTypography = RadioboxTypography.description
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<RadioboxAppearance>] = [m, s].map { $0.variation }
}

extension RadioboxAppearance {
    static var base: RadioboxAppearance {
        RadioboxAppearance(
            color: .surfaceDefaultAccent,
            borderColor: .outlineDefaultTransparentTertiary,
            checkedIcon: CircleDrawer(),
            checkedIconColor: .textOnDarkPrimary,
            titleTypography: RadioboxTypography.label,
            subtitleTypography: RadioboxTypography.description,
            titleColor: .backgroundInversePrimary,
            subtitleColor: .surfaceInverseSolidPrimary.withOpacity(0.56),
            disabledAlpha: 0.4
        )
    }
}

