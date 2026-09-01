import Foundation

struct RadioboxGroupProps: MergeableConfiguration, Codable {
    typealias Props = RadioboxGroupProps
    
    var itemSpacing: KeyValue<Double>?
    var radioBoxStyle: KeyValue<String>?
}
