import Foundation
import SDDSComponents
import SDDSThemeCore

public struct Checkbox {
    public static var m: ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
        var appearance = CheckboxAppearance()
        appearance.size = SDDSCheckboxSize.medium
        appearance.titleTypography = CheckboxTypography.label
        appearance.subtitleTypography = CheckboxTypography.description
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static var s: ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
        var appearance = CheckboxAppearance()
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
