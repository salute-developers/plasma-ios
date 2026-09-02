import Foundation

struct TooltipProps: MergeableConfiguration, Codable {
    typealias Props = TooltipProps

    var backgroundColor: ColorKeyValue?
    var textColor: ColorKeyValue?
    var contentStartColor: ColorKeyValue?
    var contentStartSize: KeyValue<Double>?
    var shadow: ShadowKeyValue?
    var shape: ShapeKeyValue?
    var tailPadding: KeyValue<Double>?
    var tailWidth: KeyValue<Double>?
    var tailHeight: KeyValue<Double>?
    var offset: KeyValue<Double>?
    var contentStartPadding: KeyValue<Double>?
    var textStyle: KeyValue<String>?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
}
 