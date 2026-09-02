import Foundation

struct EditableProps: MergeableConfiguration, Codable {
    typealias Props = EditableProps
    
    var textColor: ColorKeyValue?
    var iconColor: ColorKeyValue?
    var cursorColor: ColorKeyValue?
    var disableAlpha: KeyValue<Double>?
    var textStyle: KeyValue<String>?
    var iconSize: KeyValue<Double>?
    var iconMargin: KeyValue<Double>?
}
