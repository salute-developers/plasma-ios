import Foundation

struct CounterProps: MergeableConfiguration, Codable {
    typealias Props = CounterProps
    
    var labelStyle: KeyValue<String>?
    var minWidth: KeyValue<Double>?
    var minHeight: KeyValue<Double>?
    var paddingLeft: KeyValue<Double>?
    var paddingRight: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
    var backgroundColor: ColorKeyValue?
    var textColor: ColorKeyValue?
}
