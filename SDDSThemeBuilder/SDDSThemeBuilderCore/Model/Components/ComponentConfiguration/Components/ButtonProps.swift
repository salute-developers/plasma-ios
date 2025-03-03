import Foundation

struct ButtonProps: MergeableConfiguration, Codable {
    typealias Props = ButtonProps
    
    var loadingAlpha: KeyValue<Double>?
    var disableAlpha: KeyValue<Double>?
    var shape: ShapeKeyValue?
    var labelStyle: KeyValue<String>?
    var valueStyle: KeyValue<String>?
    var height: KeyValue<Double>?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var minWidth: KeyValue<Double>?
    var iconSize: KeyValue<Double>?
    var spinnerSize: KeyValue<Double>?
    var iconMargin: KeyValue<Double>?
    var valueMargin: KeyValue<Double>?
    var iconColor: ColorKeyValue?
    var spinnerColor: ColorKeyValue?
    var labelColor: ColorKeyValue?
    var valueColor: ColorKeyValue?
    var backgroundColor: ColorKeyValue?
}
