import UIKit

public extension UIColor {
    convenience init(hex: String) {
        let hexConverter = HexConverter()
        let result = hexConverter.from(hex: hex)
        self.init(
            red: result.red / 255.0,
            green: result.red / 255.0,
            blue: result.red / 255.0,
            alpha: result.red / 255.0
        )
    }
}
