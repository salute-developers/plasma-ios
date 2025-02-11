import Foundation

public struct ComponentAppearanceVariation<Component, Appearance>: StylesFactory, Hashable {
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
    
    public var variation: Variation<Appearance> {
        .init(originalVariation: self, styles: self.styles, name: name, appearance: appearance)
    }
    
    public var styles: [AppearanceVariation<Appearance>] {
        return []
    }
}

public struct GeneralAppearanceVariation<Component, Appearance, Variation1>: StylesFactory, Hashable {
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
    
    public var variation: Variation<Appearance> {
        .init(originalVariation: self, styles: styles, name: name, appearance: appearance)
    }
    
    public var styles: [AppearanceVariation<Appearance>] {
        return []
    }
}

public protocol StylesFactory<Appearance> {
    associatedtype Appearance
    
    var styles: [AppearanceVariation<Appearance>] { get }
}

public struct Variation<Appearance>: Hashable {
    public let originalVariation: Any
    public let styles: [AppearanceVariation<Appearance>]
    public let name: String
    public let appearance: Appearance
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    public init(originalVariation: Any, styles: [AppearanceVariation<Appearance>], name: String, appearance: Appearance) {
        self.originalVariation = originalVariation
        self.styles = styles
        self.name = name
        self.appearance = appearance
    }
    
    public static func == (
        lhs: Variation<Appearance>,
        rhs: Variation<Appearance>) -> Bool {
        return lhs.name == rhs.name
    }
}
