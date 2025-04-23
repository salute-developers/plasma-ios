import Foundation

struct SegmentProps: MergeableConfiguration, Codable {
    typealias Props = SegmentProps
    
    var shape: ShapeKeyValue?
    var backgroundColor: ColorKeyValue?
    var segmentItemStyle: KeyValue<String>?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
}
