import Foundation

public struct AppearanceVariation<Appearance>: Hashable {
    public let name: String
    public let appearance: Appearance
    
    public init(name: String = "", appearance: Appearance) {
        self.name = name
        self.appearance = appearance
    }
    
    public static func == (lhs: AppearanceVariation<Appearance>, rhs: AppearanceVariation<Appearance>) -> Bool {
        return lhs.name == rhs.name
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

public struct AppearanceThemeVariation<Appearance, Theme>: Hashable {
    public let name: String
    public let appearance: Appearance
    
    public init(name: String = "", appearance: Appearance) {
        self.name = name
        self.appearance = appearance
    }
    
    public static func == (lhs: AppearanceThemeVariation<Appearance, Theme>, rhs: AppearanceThemeVariation<Appearance, Theme>) -> Bool {
        return lhs.name == rhs.name
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
