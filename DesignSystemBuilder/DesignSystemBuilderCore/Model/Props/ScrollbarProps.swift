import Foundation

struct ScrollbarProps: MergeableConfiguration, Codable {
    typealias Props = ScrollbarProps
    
    var thumbColor: ColorKeyValue?
    var trackColor: ColorKeyValue?
    var shape: ShapeKeyValue?
    var width: KeyValue<Double>?
    var hoverExpandFactor: KeyValue<Double>?
}
