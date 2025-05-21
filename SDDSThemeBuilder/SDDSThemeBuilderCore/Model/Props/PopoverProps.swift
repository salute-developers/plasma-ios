import Foundation

struct PopoverProps: MergeableConfiguration, Codable {
    typealias Props = PopoverProps
    
    var width: KeyValue<Double>?
    var tailWidth: KeyValue<Double>?
    var tailHeight: KeyValue<Double>?
    var tailPadding: KeyValue<Double>?
    var offset: KeyValue<Double>?
    var shadow: ShadowKeyValue?
    var shape: ShapeKeyValue?
    var backgroundColor: ColorKeyValue?
}
