import Foundation
import SDDSThemeCore

public extension CounterAppearance {
    func size(_ size: CounterSizeConfiguration) -> CounterAppearance {
        return CounterAppearance(
            size: size,
            dataTypography: self.dataTypography,
            dataColor: self.dataColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha,
            loadingAlpha: self.loadingAlpha
        )
    }
    
    func dataTypography(_ dataTypography: TypographyConfiguration) -> CounterAppearance {
        return CounterAppearance(
            size: self.size,
            dataTypography: dataTypography,
            dataColor: self.dataColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha,
            loadingAlpha: self.loadingAlpha
        )
    }
    
    func dataColor(_ dataColor: CounterColor) -> CounterAppearance {
        return CounterAppearance(
            size: self.size,
            dataTypography: self.dataTypography,
            dataColor: dataColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha,
            loadingAlpha: self.loadingAlpha
        )
    }
    
    func backgroundColor(_ backgroundColor: CounterColor) -> CounterAppearance {
        return CounterAppearance(
            size: self.size,
            dataTypography: self.dataTypography,
            dataColor: self.dataColor,
            backgroundColor: backgroundColor,
            disabledAlpha: self.disabledAlpha,
            loadingAlpha: self.loadingAlpha
        )
    }
    
    func disabledAlpha(_ disabledAlpha: CGFloat) -> CounterAppearance {
        return CounterAppearance(
            size: self.size,
            dataTypography: self.dataTypography,
            dataColor: dataColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: disabledAlpha,
            loadingAlpha: self.loadingAlpha
        )
    }
    
    func loadingAlpha(_ loadingAlpha: CGFloat) -> CounterAppearance {
        return CounterAppearance(
            size: self.size,
            dataTypography: self.dataTypography,
            dataColor: dataColor,
            backgroundColor: self.backgroundColor,
            disabledAlpha: self.disabledAlpha,
            loadingAlpha: loadingAlpha
        )
    }
}
