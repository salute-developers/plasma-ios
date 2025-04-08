import Foundation

struct TextFieldProps: MergeableConfiguration, Codable {
    typealias Props = TextFieldProps
    
    var disableAlpha: KeyValue<Double>?
    var prefixPadding: KeyValue<Double>?
    var suffixPadding: KeyValue<Double>?
    var optionalPadding: KeyValue<Double>?
    var helperTextPadding: KeyValue<Double>?
    var chipsPadding: KeyValue<Double>?
    var captionPlacement: KeyValue<String>?
    var counterPlacement: KeyValue<String>?
    var captionStyle: KeyValue<String>?
    var counterStyle: KeyValue<String>?
    var chipGroupStyle: KeyValue<String>?
    var valueColor: ColorKeyValue?
    var valueColorReadOnly: ColorKeyValue?
    var startContentColor: ColorKeyValue?
    var startContentColorReadOnly: ColorKeyValue?
    var endContentColor: ColorKeyValue?
    var endContentColorReadOnly: ColorKeyValue?
    var optionalColor: ColorKeyValue?
    var counterColor: ColorKeyValue?
    var captionColor: ColorKeyValue?
    var captionColorReadOnly: ColorKeyValue?
    var placeholderColor: ColorKeyValue?
    var placeholderColorReadOnly: ColorKeyValue?
    var backgroundColor: ColorKeyValue?
    var backgroundColorReadOnly: ColorKeyValue?
    var indicatorColor: ColorKeyValue?
    var cursorColor: ColorKeyValue?
    var dividerColor: ColorKeyValue?
    var dividerColorReadOnly: ColorKeyValue?
    var lineColor: ColorKeyValue?
    var labelPlacement: KeyValue<String>?
    var shape: ShapeKeyValue?
    var chipStyle: KeyValue<String>?
    var boxPaddingStart: KeyValue<Double>?
    var boxPaddingEnd: KeyValue<Double>?
    var boxPaddingTop: KeyValue<Double>?
    var boxPaddingBottom: KeyValue<Double>?
    var startContentPadding: KeyValue<Double>?
    var endContentPadding: KeyValue<Double>?
    var boxMinHeight: KeyValue<Double>?
    var alignmentMinHeight: KeyValue<Double>?
    var startContentSize: KeyValue<Double>?
    var endContentSize: KeyValue<Double>?
    var valueStyle: KeyValue<String>?
    var placeholderStyle: KeyValue<String>?
    var fieldType: KeyValue<String>?
    var indicatorSize: KeyValue<Double>?
    var labelColor: ColorKeyValue?
    var labelPadding: KeyValue<Double>?
    var labelStyle: KeyValue<String>?
    var optionalStyle: KeyValue<String>?
    var indicatorOffsetX: KeyValue<Double>?
    var indicatorOffsetY: KeyValue<Double>?
    var scrollBarThickness: KeyValue<Double>?
    var scrollBarPaddingTop: KeyValue<Double>?
    var scrollBarPaddingBottom: KeyValue<Double>?
    var scrollBarPaddingEnd: KeyValue<Double>?
    var scrollBarTrackColor: ColorKeyValue?
    var scrollBarThumbColor: ColorKeyValue?
}
