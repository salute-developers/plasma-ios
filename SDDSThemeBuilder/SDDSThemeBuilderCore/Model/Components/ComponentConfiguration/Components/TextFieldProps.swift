import Foundation

struct TextFieldProps: MergeableConfiguration, Codable {
    typealias Props = TextFieldProps
    
    let disableAlpha: KeyValue<Double>?
    let prefixPadding: KeyValue<Double>?
    let suffixPadding: KeyValue<Double>?
    let optionalPadding: KeyValue<Double>?
    let helperTextPadding: KeyValue<Double>?
    let chipsPadding: KeyValue<Double>?
    let captionPlacement: KeyValue<String>?
    let counterPlacement: KeyValue<String>?
    let captionStyle: KeyValue<String>?
    let counterStyle: KeyValue<String>?
    let chipGroupStyle: KeyValue<String>?
    let valueColor: ColorKeyValue?
    let startContentColor: ColorKeyValue?
    let endContentColor: ColorKeyValue?
    let endContentColorReadOnly: ColorKeyValue?
    let optionalColor: ColorKeyValue?
    let counterColor: ColorKeyValue?
    let captionColor: ColorKeyValue?
    let placeholderColor: ColorKeyValue?
    let backgroundColor: ColorKeyValue?
    let backgroundColorReadOnly: ColorKeyValue?
    let indicatorColor: ColorKeyValue?
    let cursorColor: ColorKeyValue?
    let dividerColor: ColorKeyValue?
    let dividerColorReadOnly: ColorKeyValue?
    let captionColorReadOnly: ColorKeyValue?
    let lineColor: ColorKeyValue?
    let labelPlacement: KeyValue<String>?
    let shape: ShapeKeyValue?
    let chipStyle: KeyValue<String>?
    let boxPaddingStart: KeyValue<Double>?
    let boxPaddingEnd: KeyValue<Double>?
    let boxPaddingTop: KeyValue<Double>?
    let boxPaddingBottom: KeyValue<Double>?
    let startContentPadding: KeyValue<Double>?
    let endContentPadding: KeyValue<Double>?
    let boxMinHeight: KeyValue<Double>?
    let alignmentMinHeight: KeyValue<Double>?
    let startContentSize: KeyValue<Double>?
    let endContentSize: KeyValue<Double>?
    let valueStyle: KeyValue<String>?
    let placeholderStyle: KeyValue<String>?
    let fieldType: KeyValue<String>?
    let indicatorSize: KeyValue<Double>?
    let labelColor: ColorKeyValue?
    let labelPadding: KeyValue<Double>?
    let labelStyle: KeyValue<String>?
    let optionalStyle: KeyValue<String>?
    let indicatorOffsetX: KeyValue<Double>?
    let indicatorOffsetY: KeyValue<Double>?
}
