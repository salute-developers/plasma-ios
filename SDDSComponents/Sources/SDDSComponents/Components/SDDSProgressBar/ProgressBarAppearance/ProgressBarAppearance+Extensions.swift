import Foundation

public extension ProgressBarAppearance {
    func size(_ size: ProgressBarSizeConfiguration) -> ProgressBarAppearance {
        return ProgressBarAppearance(
            size: size,
            tintFillStyle: self.tintFillStyle,
            trackColor: self.trackColor
        )
    }
    
    func tintFillStyle(_ tintFillStyle: FillStyle) -> ProgressBarAppearance {
        return ProgressBarAppearance(
            size: self.size,
            tintFillStyle: tintFillStyle,
            trackColor: self.trackColor
        )
    }
    
    func trackColor(_ trackColor: ColorToken) -> ProgressBarAppearance {
        return ProgressBarAppearance(
            size: self.size,
            tintFillStyle: self.tintFillStyle,
            trackColor: trackColor
        )
    }
    
    func applyColorVariation(variation: ProgressBarAppearance) -> ProgressBarAppearance {
        return ProgressBarAppearance(
            size: self.size,
            tintFillStyle: variation.tintFillStyle,
            trackColor: variation.trackColor
        )
    }
}
