import Foundation

struct TabBarItemProps: MergeableConfiguration, Codable {
    typealias Props = TabBarItemProps
    
    var labelColor: ColorKeyValue?
    var iconColor: ColorKeyValue?
    var backgroundColor: ColorKeyValue?
    var labelStyle: KeyValue<String>?
    var labelPlacement: KeyValue<String>?
    var shape: ShapeKeyValue?
    var minHeight: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
    var iconSize: KeyValue<String>?
    var labelPadding: KeyValue<Double>?
    var counterStyle: ComponentStyleKeyValue<CounterProps>?
    var indicatorStyle: ComponentStyleKeyValue<IndicatorProps>?
}
