import Foundation
import SDDSComponents
import SDDSThemeCore

public struct Radiobox {
    public static var m: ComponentAppearanceVariation<Radiobox, RadioboxAppearance> {
        var appearance = RadioboxAppearance()
        appearance.size = SDDSRadioboxSize.medium
        appearance.titleTypography = RadioboxTypography.label
        appearance.subtitleTypography = RadioboxTypography.description
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    public static var s: ComponentAppearanceVariation<Radiobox, RadioboxAppearance> {
        var appearance = RadioboxAppearance()
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
