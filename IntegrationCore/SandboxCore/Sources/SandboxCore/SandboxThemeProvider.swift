import Foundation

public protocol SandboxThemeProvider: Sendable {
    var id: String { get }
    var title: String { get }

    func variantNames(for component: ComponentKey) -> [String]
    func appearanceNames(for component: ComponentKey, variant: String) -> [String]
}

public struct AnySandboxTheme: Identifiable, Hashable {
    public let id: String
    public let title: String
    public let provider: any SandboxThemeProvider

    public init(provider: any SandboxThemeProvider) {
        self.id = provider.id
        self.title = provider.title
        self.provider = provider
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: AnySandboxTheme, rhs: AnySandboxTheme) -> Bool {
        lhs.id == rhs.id
    }
}
