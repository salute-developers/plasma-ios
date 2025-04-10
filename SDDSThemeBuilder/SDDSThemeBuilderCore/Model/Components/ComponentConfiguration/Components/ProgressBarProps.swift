import Foundation

struct ProgressBarProps: MergeableConfiguration, Codable {
    typealias Props = ProgressBarProps
    
    var indicatorColor: ColorKeyValue?
    var backgroundColor: ColorKeyValue?
    var indicatorShape: ShapeKeyValue?
    var backgroundShape: ShapeKeyValue?
    var backgroundHeight: KeyValue<Double>?
    var indicatorHeight: KeyValue<Double>?
}
