import Foundation

struct BottomSheetProps: MergeableConfiguration, Codable {
    typealias Props = BottomSheetProps
    
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
    var shape: ShapeKeyValue?
    var handleShape: ShapeKeyValue?
    var backgroundColor: ColorKeyValue?
    var handleColor: ColorKeyValue?
    var handleWidth: KeyValue<Double>?
    var handleHeight: KeyValue<Double>?
    var handleOffset: KeyValue<Double>?
    var handlePlacement: KeyValue<String>?
}
