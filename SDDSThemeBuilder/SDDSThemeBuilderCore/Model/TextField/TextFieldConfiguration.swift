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
    
    init(type: String? = nil, value: String? = nil, adjustment: Double? = nil) {
        self.type = type
        self.value = value
        self.adjustment = adjustment
    }
}

enum TextFieldVariationNode: String, Codable {
    case outerLabel = "outer-label"
    case innerLabel = "inner-label"
    case requiredEnd = "required-end"
    case requiredStart = "required-start"
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

extension TextFieldConfiguration {
    var allProps: [String: TextFieldVariation] {
        var result = [String: TextFieldVariation]()
        for variation in self.variations {
            result[variation.id] = variation
        }
        return result
    }
    
    func child(for key: SizeVariationKey, nodes: [TextFieldVariationNode]) -> TextFieldVariation? {
        return child(props: allProps, key: key, nodes: nodes)
    }
    
    func child(props: [String: TextFieldVariation], key: SizeVariationKey, nodes: [TextFieldVariationNode]) -> TextFieldVariation? {
        let path = ([key.rawValue] + nodes.map { $0.rawValue }).joined(separator: ".")
        return props[path]
    }
}
