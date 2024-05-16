import Foundation

/// Структура темы, она дает единую точку доступа для всех токенов.
///
/// # Пример:
/// ```swift
/// func example() {
///     let color = Theme.colors.backgroundDarkPrimary.color
///     let shape = Theme.shapes.roundL
///     let typography = Theme.typographies.bodyLBold.typography
///     let shadow = Theme.shadows.downHardL
/// }
/// ```
///
/// Эта структура содержит вложенные структуры для работы с цветами, формами, типографикой и тенями.
public struct Theme {
    public static let colors = Colors()
    public static let shapes = Shapes()
    public static let typographies = Typographies()
    public static let shadows = Shadows()
}
