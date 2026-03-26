import Combine
import Foundation

public final class ThemeManager: ObservableObject {
    public static let shared = ThemeManager()

    @Published public private(set) var themes: [AnySandboxTheme] = []
    @Published public private(set) var currentTheme: AnySandboxTheme?

    private init() {}

    public func register(_ theme: AnySandboxTheme) {
        guard !themes.contains(where: { $0.id == theme.id }) else {
            return
        }

        themes.append(theme)

        if currentTheme == nil {
            currentTheme = theme
        }
    }

    public func register(_ provider: any SandboxThemeProvider) {
        register(AnySandboxTheme(provider: provider))
    }

    public func selectTheme(withId id: String) {
        guard let theme = themes.first(where: { $0.id == id }) else {
            return
        }

        currentTheme = theme
    }

    public func reset() {
        themes.removeAll()
        currentTheme = nil
    }
}
