import Foundation

struct DividerProps: MergeableConfiguration, Codable {
    typealias Props = DividerProps
    
    var shape: ShapeKeyValue?
    var backgroundColor: ColorKeyValue?
    var thickness: KeyValue<Double>?
}
