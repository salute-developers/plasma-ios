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
