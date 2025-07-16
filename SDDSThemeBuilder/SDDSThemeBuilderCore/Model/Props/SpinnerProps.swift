import Foundation

struct SpinnerProps: MergeableConfiguration, Codable {
    typealias Props = SpinnerProps
    
    var backgroundColor: ColorKeyValue?
    var angle: KeyValue<Double>?
    var strokeCap: KeyValue<String>?
    var size: KeyValue<Double>?
    var padding: KeyValue<Double>?
    var startColor: ColorKeyValue?
    var endColor: ColorKeyValue?
} 