import Foundation

struct SkeletonProps: MergeableConfiguration, Codable {
    typealias Props = SkeletonProps
    
    var shape: ShapeKeyValue?
    var gradient: ColorKeyValue?
    var duration: KeyValue<Double>?
    var hoverExpandFactor: KeyValue<Double>?
}
