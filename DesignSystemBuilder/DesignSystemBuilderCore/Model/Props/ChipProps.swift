import Foundation

struct ChipProps: MergeableConfiguration, Codable {
    typealias Props = ChipProps
    
    var shape: ShapeKeyValue?
    var labelStyle: KeyValue<String>?
    var height: KeyValue<Double>?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var minWidth: KeyValue<Double>?
    var iconSize: KeyValue<Double>?
    var contentStartSize: KeyValue<Double>?
    var contentStartPadding: KeyValue<Double>?
    var contentEndSize: KeyValue<Double>?
    var contentEndPadding: KeyValue<Double>?
    var contentEndColor: ColorKeyValue?
    var contentStartColor: ColorKeyValue?
    var labelColor: ColorKeyValue?
    var backgroundColor: ColorKeyValue?
    var disableAlpha: KeyValue<Double>?
}
