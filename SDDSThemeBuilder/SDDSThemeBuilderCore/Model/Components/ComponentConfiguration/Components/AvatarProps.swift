import Foundation

struct AvatarProps: MergeableConfiguration, Codable {
    typealias Props = AvatarProps
    
    var width: KeyValue<Double>?
    var height: KeyValue<Double>?
    var textStyle: KeyValue<String>?
    var statusOffsetX: KeyValue<Double>?
    var statusOffsetY: KeyValue<Double>?
    var statusStyle: KeyValue<String>?
    var counterStyle: KeyValue<String>?
    var badgeStyle: KeyValue<String>?
    var background: ColorKeyValue?
    var shape: ShapeKeyValue?
    var textColor: ColorKeyValue?
    var activeStatusColor: ColorKeyValue?
    var inactiveStatusColor: ColorKeyValue?
}
