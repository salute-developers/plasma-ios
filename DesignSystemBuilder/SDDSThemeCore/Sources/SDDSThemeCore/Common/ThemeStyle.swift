import Foundation

public enum ThemeStyle: String, CaseIterable {
    case light
    case dark
}

public extension ThemeStyle {
    var title: String {
        rawValue.capitalized
    }
}
