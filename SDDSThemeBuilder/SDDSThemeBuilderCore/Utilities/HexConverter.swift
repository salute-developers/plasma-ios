import Foundation

final class HexConverter {
    
    struct Result {
        let red: CGFloat
        let green: CGFloat
        let blue: CGFloat
        let alpha: CGFloat
    }
    
    func from(hex: String) -> HexConverter.Result {
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
        case 3:
            red = ((rgbValue >> 8) & 0xF) * 17
            green = ((rgbValue >> 4) & 0xF) * 17
            blue = (rgbValue & 0xF) * 17
            alpha = 255
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
        return Result(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: CGFloat(alpha)
        )
    }
}
