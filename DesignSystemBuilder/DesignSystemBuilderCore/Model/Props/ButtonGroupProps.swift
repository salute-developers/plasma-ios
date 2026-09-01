import Foundation

struct ButtonGroupProps: MergeableConfiguration, Codable {
    typealias Props = ButtonGroupProps
    
    var spacing: KeyValue<Double>?
    var externalShape: ShapeKeyValue?
    var internalShape: ShapeKeyValue?
    var buttonStyle: ComponentStyleKeyValue<ButtonProps>?
}
