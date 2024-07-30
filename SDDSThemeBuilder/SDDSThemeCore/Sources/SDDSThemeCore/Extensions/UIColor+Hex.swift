import UIKit
import SDDSThemeUtilities

public extension UIColor {
    convenience init(hex: String) {
        let hexConverter = HexConverter()
        let result = hexConverter.from(hex: hex)
        self.init(
            red: result.red / 255.0,
            green: result.green / 255.0,
            blue: result.blue / 255.0,
            alpha: result.alpha / 255.0
        )
    }
}
