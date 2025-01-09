import Foundation
import SDDSThemeCore

public extension CounterAppearance {
    func size(_ size: CounterSizeConfiguration) -> CounterAppearance {
        return CounterAppearance(
            size: size,
            textTypography: self.textTypography,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor

        )
    }
    
    func textTypography(_ textTypography: TypographyConfiguration) -> CounterAppearance {
        return CounterAppearance(
            size: self.size,
            textTypography: textTypography,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor
        )
    }
    
    func textColor(_ textColor: ButtonColor) -> CounterAppearance {
        return CounterAppearance(
            size: self.size,
            textTypography: self.textTypography,
            textColor: textColor,
            backgroundColor: self.backgroundColor
        )
    }
    
    func backgroundColor(_ backgroundColor: ButtonColor) -> CounterAppearance {
        return CounterAppearance(
            size: self.size,
            textTypography: self.textTypography,
            textColor: self.textColor,
            backgroundColor: backgroundColor
        )
    }
}
