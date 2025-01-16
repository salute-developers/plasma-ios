import Foundation

struct ButtonProps: MergeableConfiguration, Codable {
    typealias Props = ButtonProps
    
    let loadingAlpha: KeyValue<Double>?
    let disableAlpha: KeyValue<Double>?
    let shape: ShapeKeyValue?
    let labelStyle: KeyValue<String>?
    let valueStyle: KeyValue<String>?
    let height: KeyValue<Double>?
    let paddingStart: KeyValue<Double>?
    let paddingEnd: KeyValue<Double>?
    let minWidth: KeyValue<Double>?
    let iconSize: KeyValue<Double>?
    let spinnerSize: KeyValue<Double>?
    let iconMargin: KeyValue<Double>?
    let valueMargin: KeyValue<Double>?
    let iconColor: ColorKeyValue?
    let spinnerColor: ColorKeyValue?
    let labelColor: ColorKeyValue?
    let valueColor: ColorKeyValue?
    let backgroundColor: ColorKeyValue?
}
