import SwiftUI

/// Text content displayed by ``SDDSText``.
public enum SDDSTextSource {
    case string(String)
    case localized(LocalizedStringKey)
    case attributed(AttributedString)
    /// Wraps an existing `Text` builder for rare cases (accessibility, `Text`+`Image` composition).
    case text(Text)
}
