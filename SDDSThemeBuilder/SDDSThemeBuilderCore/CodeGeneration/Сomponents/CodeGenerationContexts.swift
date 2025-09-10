import Foundation

// MARK: - Existing components
typealias TextFieldBaseContext = ComponentBaseContext<TextFieldAppearance>
typealias TextFieldVariationsContext = ComponentVariationsContext<TextFieldAppearance, TextFieldSize>
typealias TextFieldSizeContext = ComponentSizeContext<TextFieldSize>
typealias TextFieldTypographyContext = ComponentTypographyContext<TextFieldAppearance>

// MARK: - ButtonGroup contexts
typealias ButtonGroupBaseContext = ComponentBaseContext<ButtonGroupAppearance>
typealias ButtonGroupVariationsContext = ComponentVariationsContext<ButtonGroupAppearance, ButtonGroupSize>
typealias ButtonGroupSizeContext = ComponentSizeContext<ButtonGroupSize>

// MARK: - Generic contexts
struct ComponentBaseContext<Appearance: Codable>: Codable {
    struct Variation: Codable {
        let appearance: Appearance
        let next: String
    }
    
    var component: String
    var appearance: String
    var variations: [String: Variation]
    var all: [String]
    var chains: [String]
    var base: Appearance
}

struct ComponentVariationsContext<Appearance: Codable, Size: Codable>: Codable {
    struct Variation: Codable {
        let appearance: Appearance
        let size: Size
        let next: String
        let chain: String
    }
    
    struct View: Codable {
        let appearance: Appearance
    }
    
    var component: String
    var appearance: String
    var variations: [String: [String: Variation]]
    var variationViews: [String: [String: View]]
    var views: [String: View]
}

struct ComponentSizeContext<Size: Codable>: Codable {
    var component: String
    var appearance: String
    var sizeConfiguration: String
    var variations: [String: Size]
    var zeroSize: Size
}

struct ComponentTypographyContext<Appearance: Codable>: Codable {
    var component: String
    var appearance: String
    var sizeConfiguration: String
    var variations: [String: Appearance]
}
