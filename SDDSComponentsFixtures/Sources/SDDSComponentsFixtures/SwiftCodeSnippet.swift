import SwiftUI

/// Обёртка для извлечения кода в документацию (аналог `composableCodeSnippet` на Android).
/// Экстрактор сниппетов распознаёт `swiftCodeSnippet { ... }` и извлекает только содержимое closure.
///
/// Использование в примере с `// @DocSample`:
/// ```swift
/// // @DocSample
/// struct Button_Snippet: View {
///     var body: some View {
///         swiftCodeSnippet {
///             BasicButton(title: "Label", subtitle: "", action: {})
///         }
///     }
/// }
/// ```
public func swiftCodeSnippet<Content: View>(@ViewBuilder content: () -> Content) -> some View {
    content()
}
