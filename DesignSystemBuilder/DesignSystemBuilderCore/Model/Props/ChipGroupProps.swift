import Foundation

struct ChipGroupProps: MergeableConfiguration, Codable {
    typealias Props = ChipGroupProps
    
    var disableAlpha: KeyValue<Double>?
    var gap: KeyValue<Double>?
    var lineSpacing: KeyValue<Double>?
    var chipStyle: KeyValue<String>?
}
