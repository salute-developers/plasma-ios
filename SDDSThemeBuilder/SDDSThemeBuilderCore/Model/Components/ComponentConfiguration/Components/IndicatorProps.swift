import Foundation

struct IndicatorProps: MergeableConfiguration, Codable {
    typealias Props = IndicatorProps
    
    var height: KeyValue<Double>?
    var width: KeyValue<Double>?
    var backgroundColor: ColorKeyValue?
}
