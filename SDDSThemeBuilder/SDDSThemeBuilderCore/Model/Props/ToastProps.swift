import Foundation

struct ToastProps: MergeableConfiguration, Codable {
    typealias Props = ToastProps

    var backgroundColor: ColorKeyValue?
    var textColor: ColorKeyValue?
    var contentStartColor: ColorKeyValue?
    var contentEndColor: ColorKeyValue?
    var contentStartSize: KeyValue<Double>?
    var contentEndSize: KeyValue<Double>?
    var contentStartPadding: KeyValue<Double>?
    var contentEndPadding: KeyValue<Double>?
    var textStyle: KeyValue<String>?
    var shape: ShapeKeyValue?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
} 