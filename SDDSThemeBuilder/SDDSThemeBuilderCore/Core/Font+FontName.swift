import Foundation

extension Font {
    var fontName: String {
        link.lastPathComponent.keyComponents.first ?? ""
    }
}
