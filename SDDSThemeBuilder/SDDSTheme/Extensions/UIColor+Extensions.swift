import UIKit

extension UIColor {
    convenience init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }
        
        let scanner = Scanner(string: hexString)
        
        var rgbValue: UInt64 = 0
        guard scanner.scanHexInt64(&rgbValue) else {
            fatalError("Incorrect hex color format")
        }
        
        var red, green, blue, alpha: UInt64
        switch hexString.count {
        case 6:
            red = (rgbValue >> 16) & 0xFF
            green = (rgbValue >> 8) & 0xFF
            blue = rgbValue & 0xFF
            alpha = 255
        case 8:
            red = (rgbValue >> 24) & 0xFF
            green = (rgbValue >> 16) & 0xFF
            blue = (rgbValue >> 8) & 0xFF
            alpha = rgbValue & 0xFF
        default:
            fatalError("Incorrect hex color format")
        }
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }
}
