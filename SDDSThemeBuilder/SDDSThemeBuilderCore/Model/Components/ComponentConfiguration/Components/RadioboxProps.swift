import Foundation

struct RadioboxProps: MergeableConfiguration, Codable {
    typealias Props = RadioboxProps
    
    var togglePadding: KeyValue<Double>?
    var toggleBorderWidth: KeyValue<Double>?
    var toggleWidth: KeyValue<Double>?
    var toggleHeight: KeyValue<Double>?
    var toggleIconWidth: KeyValue<Double>?
    var toggleIconHeight: KeyValue<Double>?
    var textPadding: KeyValue<Double>?
    var descriptionPadding: KeyValue<Double>?
    var toggleIndeterminateWidth: KeyValue<Double>?
    var toggleIndeterminateHeight: KeyValue<Double>?
    var disableAlpha: KeyValue<Double>?
    var labelStyle: KeyValue<String>?
    var descriptionStyle: KeyValue<String>?
    var shape: ShapeKeyValue?
    var toggleIndeterminateIconColor: ColorKeyValue?
    var toggleColor: ColorKeyValue?
    var toggleBorderColor: ColorKeyValue?
    var labelColor: ColorKeyValue?
    var descriptionColor: ColorKeyValue?
    var toggleIconColor: ColorKeyValue?
}
