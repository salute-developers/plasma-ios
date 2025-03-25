import Foundation
import SDDSComponents
import SDDSThemeCore

public struct Checkbox {
    public static var m: ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
        var appearance = CheckboxAppearance.base
        appearance.size = SDDSCheckboxSize.medium
        appearance.titleTypography = CheckboxTypography.label
        appearance.subtitleTypography = CheckboxTypography.description
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static var s: ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
        var appearance = CheckboxAppearance.base
        appearance.size = SDDSCheckboxSize.small
        appearance.titleTypography = CheckboxTypography.label
        appearance.subtitleTypography = CheckboxTypography.description
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<CheckboxAppearance>] = [m, s].map { $0.variation }
}

extension CheckboxAppearance {
    static var base: CheckboxAppearance {
        CheckboxAppearance(
            titleTypography: CheckboxTypography.label,
            subtitleTypography: CheckboxTypography.description,
            titleColor: .backgroundInversePrimary,
            subtitleColor: .surfaceInverseSolidPrimary.withOpacity(0.56),
            disabledAlpha: 0.4,
            color: .surfaceDefaultAccent,
            borderColor: .outlineDefaultTransparentTertiary,
            checkedIcon: CheckmarkDrawer(lineWidth: 2),
            checkedIconColor: .textOnDarkPrimary,
            toggleIndeterminateIconColor: .textOnDarkPrimary
        )
    }
}
