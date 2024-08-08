import Foundation

/**
 `ProgressBarAppearance` определяет внешний вид прогресс-бара, включая цвет индикатора и фона.
 
 - Properties:
    - tintColor: Цвет индикатора прогресса.
    - trackColor: Цвет фона прогресс-бара.
 */
public struct ProgressBarAppearance {
    public let tintFillStyle: FillStyle
    public let trackColor: ColorToken
    
    public init(tintFillStyle: FillStyle, trackColor: ColorToken) {
        self.tintFillStyle = tintFillStyle
        self.trackColor = trackColor
    }
}
