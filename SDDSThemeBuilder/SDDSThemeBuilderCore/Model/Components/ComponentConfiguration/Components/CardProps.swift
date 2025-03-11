import Foundation

struct CardProps: MergeableConfiguration, Codable {
    typealias Props = CardProps
    
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
    var shape: ShapeKeyValue?
    var backgroundColor: ColorKeyValue?
}
