import Foundation

struct CheckboxGroupProps: MergeableConfiguration, Codable {
    typealias Props = CheckboxGroupProps
    
    var itemOffset: KeyValue<Double>?
    var itemSpacing: KeyValue<Double>?
    var checkBoxStyle: KeyValue<String>?
}
