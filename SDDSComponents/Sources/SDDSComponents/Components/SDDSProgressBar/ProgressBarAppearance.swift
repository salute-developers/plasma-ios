import Foundation

/**
 `ProgressBarAppearance` определяет внешний вид прогресс-бара, включая цвет индикатора и фона.
 
 - Properties:
    - tintColor: Цвет индикатора прогресса.
    - trackColor: Цвет фона прогресс-бара.
 */
public struct ProgressBarAppearance {
    public let tintColor: ColorToken
    public let trackColor: ColorToken
    
    public init(tintColor: ColorToken, trackColor: ColorToken) {
        self.tintColor = tintColor
        self.trackColor = trackColor
    }
}
