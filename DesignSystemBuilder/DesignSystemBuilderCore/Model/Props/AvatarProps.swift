import Foundation

struct AvatarProps: MergeableConfiguration, Codable {
    typealias Props = AvatarProps
    
    var shape: ShapeKeyValue?
    var background: ColorKeyValue?
    var activeStatusColor: ColorKeyValue?
    var inactiveStatusColor: ColorKeyValue?
    var textColor: ColorKeyValue?
    var textStyle: KeyValue<String>?
    var width: KeyValue<Double>?
    var height: KeyValue<Double>?
    var statusOffsetX: KeyValue<Double>?
    var statusOffsetY: KeyValue<Double>?
    var extraOffsetX: KeyValue<Double>?
    var extraOffsetY: KeyValue<Double>?
    var statusStyle: ComponentStyleKeyValue<IndicatorProps>?
    var badgeStyle: ComponentStyleKeyValue<BadgeProps>?
    var counterStyle: ComponentStyleKeyValue<CounterProps>?
}
