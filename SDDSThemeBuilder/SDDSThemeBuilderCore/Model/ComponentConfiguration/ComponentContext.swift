import Foundation

typealias TextFieldContext = ComponentContext<TextFieldAppearance, TextFieldSize>

struct ComponentContext<Appearance: Codable, Size: Codable> {
    let typography: ComponentTypographyContext<Appearance>
    let size: ComponentSizeContext<Size>
    let base: ComponentBaseContext<Appearance>
    let variations: ComponentVariationsContext<Appearance, Size>
}
