import Foundation

struct SegmentItemProps: MergeableConfiguration, Codable {
    typealias Props = SegmentItemProps
    
    var shape: ShapeKeyValue?
    var backgroundColor: ColorKeyValue?
    var labelColor: ColorKeyValue?
    var valueColor: ColorKeyValue?
    var startContentColor: ColorKeyValue?
    var endContentColor: ColorKeyValue?
    var disableAlpha: KeyValue<Double>?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var minHeight: KeyValue<Double>?
    var minWidth: KeyValue<Double>?
    var startContentSize: KeyValue<Double>?
    var endContentSize: KeyValue<Double>?
    var iconMargin: KeyValue<Double>?
    var counterMargin: KeyValue<Double>?
    var valueMargin: KeyValue<Double>?
    var labelStyle: KeyValue<String>?
    var valueStyle: KeyValue<String>?
    var counterStyle: ComponentStyleKeyValue<CounterProps>?
}
