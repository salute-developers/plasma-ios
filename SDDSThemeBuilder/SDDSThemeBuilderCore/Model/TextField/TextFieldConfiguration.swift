import Foundation

struct KeyValue<T: Codable>: Codable {
    let type: String?
    let value: T?
}

struct ColorKeyValue: Codable {
    let type: String?
    let defaultValue: String?
}

struct ColorWithStatesKeyValue: Codable {
    let type: String?
    let defaultValue: String?
    let states: [ColorState]?
}

struct ColorWithAlphaKeyValue: Codable {
    let type: String?
    let defaultValue: String?
    let alpha: Double?
}

struct ColorState: Codable {
    let state: [String]?
    let value: String?
}

struct ShapeKeyValue: Codable {
    let type: String?
    let value: String?
    let adjustment: Double?
}

struct TextFieldProps: Codable {
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
    let endContentColor: ColorWithStatesKeyValue?
    let endContentColorReadOnly: ColorWithAlphaKeyValue?
    let optionalColor: ColorKeyValue?
    let counterColor: ColorKeyValue?
    let placeholderColor: ColorWithStatesKeyValue?
    let backgroundColorReadOnly: ColorWithAlphaKeyValue?
    let indicatorColor: ColorKeyValue?
    let cursorColor: ColorKeyValue?
    let captionColorReadOnly: ColorKeyValue?
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

struct TextFieldVariation: Codable {
    let id: String
    let parent: String?
    let props: TextFieldProps
}

struct TextFieldConfiguration: Codable {
    struct Style: Codable {
        let props: TextFieldProps
    }

    let view: [String: Style]
    let props: TextFieldProps
    let variations: [TextFieldVariation]
}
