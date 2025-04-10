import Foundation

struct ProgressbarProps: MergeableConfiguration, Codable {
    typealias Props = ProgressbarProps
    
    var indicatorColor: ColorKeyValue?
    var backgroundColor: ColorKeyValue?
    var indicatorShape: ShapeKeyValue?
    var backgroundShape: ShapeKeyValue?
    var backgroundHeight: KeyValue<Double>?
    var indicatorHeight: KeyValue<Double>?
}
