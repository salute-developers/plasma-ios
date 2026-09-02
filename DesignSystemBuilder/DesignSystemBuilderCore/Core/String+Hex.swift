import Foundation
import SwiftUI

extension String {
    func applyAlpha(alpha: CGFloat) -> String {
        var color = Color(hex: self)
        color = color.opacity(alpha)
        return color.hex ?? ""
    }
}
