import Foundation

public extension CounterAppearance {
    func applyColorVariation(variation: CounterAppearance) -> CounterAppearance {
        CounterAppearance(
            size: size,
            dataTypography: dataTypography,
            dataColor: variation.dataColor,
            backgroundColor: variation.backgroundColor,
            disabledAlpha: variation.disabledAlpha,
            loadingAlpha: variation.loadingAlpha
        )
    }
}
