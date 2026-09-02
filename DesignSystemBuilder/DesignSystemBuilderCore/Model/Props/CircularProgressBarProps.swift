import Foundation

struct CircularProgressBarProps: MergeableConfiguration, Codable {
    typealias Props = CircularProgressBarProps
    
    var width: KeyValue<Double>?
    var height: KeyValue<Double>?
    var trackThickness: KeyValue<Double>?
    var progressThickness: KeyValue<Double>?
    var valueStyle: KeyValue<String>?
    var valueColor: ColorKeyValue?
    var valueEnabled: KeyValue<Bool>?
    var trackColor: ColorKeyValue?
    var indicatorColor: ColorKeyValue?
} 