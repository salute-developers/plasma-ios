import Foundation

public struct ButtonAppearanceVariation<T>: Hashable {
    public let name: String
    public let appearance: ButtonAppearance
    
    public init(name: String = "", appearance: ButtonAppearance = ButtonAppearance()) {
        self.name = name
        self.appearance = appearance
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    public static func == (lhs: ButtonAppearanceVariation<T>, rhs: ButtonAppearanceVariation<T>) -> Bool {
        return lhs.name == rhs.name
    }
}
