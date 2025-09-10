import Foundation

struct BasicButtonGroupProps: MergeableConfiguration, Codable {
    typealias Props = BasicButtonGroupProps
    
    // Размеры и отступы
    var spacing: KeyValue<Double>?
    
    // Формы
    var externalShape: ShapeKeyValue?
    var internalShape: ShapeKeyValue?
    
    // Стили вложенных компонентов
    var buttonStyle: ComponentStyleKeyValue<ButtonProps>?
}
