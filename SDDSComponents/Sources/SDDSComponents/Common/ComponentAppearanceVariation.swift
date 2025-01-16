import Foundation

public struct ComponentAppearanceVariation<Component, Appearance>: Hashable {
    public let name: String
    public let appearance: Appearance
    
    public init(name: String = "", appearance: Appearance) {
        self.name = name
        self.appearance = appearance
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    public static func == (lhs: ComponentAppearanceVariation<Component, Appearance>, rhs: ComponentAppearanceVariation<Component, Appearance>) -> Bool {
        return lhs.name == rhs.name
    }
}

public struct GeneralAppearanceVariation<Component, Appearance, Variation1>: Hashable {
    public let name: String
    public let appearance: Appearance
    
    public init(name: String = "", appearance: Appearance) {
        self.name = name
        self.appearance = appearance
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    public static func == (
        lhs: GeneralAppearanceVariation<Component, Appearance, Variation1>,
        rhs: GeneralAppearanceVariation<Component, Appearance, Variation1>) -> Bool {
        return lhs.name == rhs.name
    }
}
