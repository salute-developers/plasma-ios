import SwiftUI

public extension View {
    func undefinedTypographyErrorText(sizeDescription: String) -> String {
        "Undefined \(Self.self) Typography for size \(sizeDescription). Using a default value."
    }
}
