import Foundation

struct NotificationProps: MergeableConfiguration {
    typealias Props = NotificationProps
    
    var backgroundColor: ColorKeyValue?
    var closeColor: ColorKeyValue?
    var closeAlignment: KeyValue<String>?
    var shape: ShapeKeyValue?
    var closeSize: KeyValue<Double>?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
}
