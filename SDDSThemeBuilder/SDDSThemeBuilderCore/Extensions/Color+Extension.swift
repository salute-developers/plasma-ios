import Foundation
import SwiftUI

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
        let components = self.cgColor?.components
        let colorSpaceModel = self.cgColor?.colorSpace?.model

        guard let colorComponents = components, colorComponents.count >= 3, colorSpaceModel == .rgb else {
            return nil
        }

        let red = colorComponents[0]
        let green = colorComponents[1]
        let blue = colorComponents[2]

        guard red >= 0 && red <= 1, green >= 0 && green <= 1, blue >= 0 && blue <= 1 else {
            return nil
        }

        let redInt = Int(red * 255)
        let greenInt = Int(green * 255)
        let blueInt = Int(blue * 255)
        let hexString = String(format: "#%02X%02X%02X", redInt, greenInt, blueInt)

        return hexString
    }
}
