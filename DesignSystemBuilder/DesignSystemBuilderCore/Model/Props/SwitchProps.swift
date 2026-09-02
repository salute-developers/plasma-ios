import Foundation

struct SwitchProps: MergeableConfiguration, Codable {
    typealias Props = SwitchProps
    
    var textPadding: KeyValue<Double>?
    var labelStyle: KeyValue<String>?
    var descriptionStyle: KeyValue<String>?
    var descriptionPadding: KeyValue<Double>?
    var backgroundColor: ColorKeyValue?
    var labelColor: ColorKeyValue?
    var descriptionColor: ColorKeyValue?
    var toggleThumbHeight: KeyValue<Double>?
    var toggleThumbPadding: KeyValue<Double>?
    var toggleThumbWidth: KeyValue<Double>?
    var toggleThumbColor: ColorKeyValue?
    var toggleThumbShape: ShapeKeyValue?
    var toggleTrackHeight: KeyValue<Double>?
    var toggleTrackWidth: KeyValue<Double>?
    var toggleTrackColor: ColorKeyValue?
    var toggleTrackBorderColor: ColorKeyValue?
    var toggleTrackShape: ShapeKeyValue?
    var disableAlpha: KeyValue<Double>?
}
