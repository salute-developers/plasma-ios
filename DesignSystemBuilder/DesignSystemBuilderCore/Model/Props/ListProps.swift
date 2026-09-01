import Foundation

struct ListProps: MergeableConfiguration, Codable {
    typealias Props = ListProps
    
    var listItemStyle: KeyValue<String>?
    var dividerStyle: KeyValue<String>?
    var scrollBarStyle: KeyValue<String>?
    var gap: KeyValue<Double>?
    var backgroundColor: ColorKeyValue?
    var shape: ShapeKeyValue?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
}
