import Foundation

public extension CounterAppearance {
    func applyColorVariation(variation: CounterAppearance) -> CounterAppearance {
        CounterAppearance(
            size: size,
            textTypography: textTypography,
            textColor: variation.textColor,
            backgroundColor: variation.backgroundColor
        )
    }
}
