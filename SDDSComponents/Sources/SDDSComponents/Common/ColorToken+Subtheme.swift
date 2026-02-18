import Foundation
import SwiftUI
import SDDSThemeCore

public extension ColorToken {
    func color(for colorScheme: ColorScheme, subtheme: SubthemeData) -> Color {
        guard !subtheme.isNone else {
            return self.color(for: colorScheme)
        }
        return subtheme.colorMapper(subtheme.subtheme, self).color(for: colorScheme)
    }
}
