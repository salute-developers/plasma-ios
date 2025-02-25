import Foundation

struct BadgeProps: MergeableConfiguration, Codable {
    typealias Props = BadgeProps
    
    var shape: ShapeKeyValue?
    var labelStyle: KeyValue<String>?
    var height: KeyValue<Double>?
    var startPadding: KeyValue<Double>?
    var endPadding: KeyValue<Double>?
    var startContentSize: KeyValue<Double>?
    var endContentSize: KeyValue<Double>?
    var startContentMargin: KeyValue<Double>?
    var endContentMargin: KeyValue<Double>?
    var labelColor: ColorKeyValue?
    var startContentColor: ColorKeyValue?
    var endContentColor: ColorKeyValue?
    var backgroundColor: ColorKeyValue?
}
