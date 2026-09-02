import Foundation

struct TabItemDefaultProps: MergeableConfiguration, Codable {
    typealias Props = TabItemDefaultProps
    
    var disableAlpha: KeyValue<Double>?
    var labelColor: ColorKeyValue?
    var valueColor: ColorKeyValue?
    var startContentColor: ColorKeyValue?
    var endContentColor: ColorKeyValue?
    var actionColor: ColorKeyValue?
    var labelStyle: KeyValue<String>?
    var valueStyle: KeyValue<String>?
    var minHeight: KeyValue<Double>?
    var startContentSize: KeyValue<Double>?
    var endContentSize: KeyValue<Double>?
    var startContentPadding: KeyValue<Double>?
    var valuePadding: KeyValue<Double>?
    var counterPadding: KeyValue<Double>?
    var actionPadding: KeyValue<Double>?
    var counterStyle: ComponentStyleKeyValue<CounterProps>?
    var actionIcon: KeyValue<String>?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var iconPadding: KeyValue<Double>?
    var actionSize: KeyValue<Double>?
    var counterOffsetX: KeyValue<Double>?
    var counterOffsetY: KeyValue<Double>?
}

