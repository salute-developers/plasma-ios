import Foundation

/// Что именно генерирует запуск: токены темы, вариации компонентов или и то, и другое.
///
/// Разделение зеркалит Android, где `generateComposeTheme` и `generateComposeComponents` —
/// независимые таски: тема и компоненты генерируются из одного `.sdds`, но ничем друг другу
/// не обязаны, и каждая половина пишет свою мету.
public enum GenerationScope: String, CaseIterable, Sendable {
    /// Только токены, шрифты и мета токенов (`config-info-tokens-ios.json`).
    case theme

    /// Только вариации компонентов, код binding-API и мета компонентов (`config-info-ios.json`).
    case components

    /// Прежнее поведение: тема и компоненты за один проход.
    case all

    /// Нужно ли генерировать токены темы.
    public var includesTheme: Bool { self != .components }

    /// Нужно ли генерировать вариации компонентов.
    public var includesComponents: Bool { self != .theme }
}
