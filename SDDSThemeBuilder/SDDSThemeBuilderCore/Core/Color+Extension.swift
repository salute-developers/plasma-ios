import Foundation
import SwiftUI
import SDDSThemeUtilities

extension Color {
    init(hex: String) {
        let hexConverter = HexConverter()
        let result = hexConverter.from(hex: hex)
        self.init(
            red: result.red / 255.0, 
            green: result.green / 255.0,
            blue: result.blue / 255.0,
            opacity: result.alpha / 255.0
        )
    }
    
    var hex: String? {
        guard let components = self.cgColor?.components,
              let colorSpaceModel = self.cgColor?.colorSpace?.model,
              components.count >= 4,
              colorSpaceModel == .rgb else {
            return nil
        }

        let red = components[0]
        let green = components[1]
        let blue = components[2]
        let alpha = components[3]

        guard red >= 0 && red <= 1, green >= 0 && green <= 1, blue >= 0 && blue <= 1, alpha >= 0 && alpha <= 1 else {
            return nil
        }

        let redInt = Int(red * 255)
        let greenInt = Int(green * 255)
        let blueInt = Int(blue * 255)
        let alphaInt = Int(alpha * 255)
        let hexString = String(format: "#%02X%02X%02X%02X", redInt, greenInt, blueInt, alphaInt)

        return hexString
    }
}
