import Foundation

struct ModalProps: MergeableConfiguration, Codable {
    typealias Props = ModalProps

    var backgroundColor: ColorKeyValue?
    var closeColor: ColorKeyValue?
    var closeSize: KeyValue<Double>?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
    var shape: ShapeKeyValue?
    var shadow: ShadowKeyValue?
} 