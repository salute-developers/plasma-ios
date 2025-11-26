import Foundation
import SwiftUI
import SDDSThemeCore

extension ColorToken {
    func color(for colorScheme: ColorScheme, subtheme: SubthemeData) -> Color {
        guard !subtheme.isNone else {
            return self.color(for: colorScheme)
        }
        return subtheme.colorMapper(subtheme.subtheme, self).color(for: colorScheme)
    }
}
