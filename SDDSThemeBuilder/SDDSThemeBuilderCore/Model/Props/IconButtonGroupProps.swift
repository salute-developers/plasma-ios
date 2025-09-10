import Foundation

struct IconButtonGroupProps: MergeableConfiguration, Codable {
    typealias Props = IconButtonGroupProps
    
    // Размеры и отступы
    var spacing: KeyValue<Double>?
    
    // Формы
    var externalShape: ShapeKeyValue?
    var internalShape: ShapeKeyValue?
    
    // Стили вложенных компонентов
    var buttonStyle: ComponentStyleKeyValue<ButtonProps>?
}
