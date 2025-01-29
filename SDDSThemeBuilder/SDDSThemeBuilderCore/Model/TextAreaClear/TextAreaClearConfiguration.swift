import Foundation

enum TextAreaClearVariationNode: String, Codable {
    case outerLabel = "outer-label"
    case innerLabel = "inner-label"
    case requiredEnd = "required-end"
    case requiredStart = "required-start"
}

struct TextAreaClearProps: Codable {
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
    let endContentColorReadOnly: ColorWithAlphaKeyValue?
    let optionalColor: ColorKeyValue?
    let counterColor: ColorKeyValue?
    let captionColor: ColorKeyValue?
    let placeholderColor: ColorKeyValue?
    let backgroundColor: ColorKeyValue?
    let backgroundColorReadOnly: ColorWithAlphaKeyValue?
    let indicatorColor: ColorKeyValue?
    let cursorColor: ColorKeyValue?
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
    
    func merge(rhs: TextAreaProps) -> TextAreaProps {
        return TextAreaProps(
            disableAlpha: self.disableAlpha ?? rhs.disableAlpha,
            prefixPadding: self.prefixPadding ?? rhs.prefixPadding,
            suffixPadding: self.suffixPadding ?? rhs.suffixPadding,
            optionalPadding: self.optionalPadding ?? rhs.optionalPadding,
            helperTextPadding: self.helperTextPadding ?? rhs.helperTextPadding,
            chipsPadding: self.chipsPadding ?? rhs.chipsPadding,
            captionPlacement: self.captionPlacement ?? rhs.captionPlacement,
            counterPlacement: self.counterPlacement ?? rhs.counterPlacement,
            captionStyle: self.captionStyle ?? rhs.captionStyle,
            counterStyle: self.counterStyle ?? rhs.counterStyle,
            chipGroupStyle: self.chipGroupStyle ?? rhs.chipGroupStyle,
            valueColor: self.valueColor ?? rhs.valueColor,
            startContentColor: self.startContentColor ?? rhs.startContentColor,
            endContentColor: self.endContentColor ?? rhs.endContentColor,
            endContentColorReadOnly: self.endContentColorReadOnly ?? rhs.endContentColorReadOnly,
            optionalColor: self.optionalColor ?? rhs.optionalColor,
            counterColor: self.counterColor ?? rhs.counterColor,
            captionColor: self.captionColor ?? rhs.captionColor,
            placeholderColor: self.placeholderColor ?? rhs.placeholderColor,
            backgroundColor: self.backgroundColor ?? rhs.backgroundColor,
            backgroundColorReadOnly: self.backgroundColorReadOnly ?? rhs.backgroundColorReadOnly,
            indicatorColor: self.indicatorColor ?? rhs.indicatorColor,
            cursorColor: self.cursorColor ?? rhs.cursorColor,
            captionColorReadOnly: self.captionColorReadOnly ?? rhs.captionColorReadOnly,
            lineColor: self.lineColor ?? rhs.lineColor,
            labelPlacement: self.labelPlacement ?? rhs.labelPlacement,
            shape: self.shape ?? rhs.shape,
            chipStyle: self.chipStyle ?? rhs.chipStyle,
            boxPaddingStart: self.boxPaddingStart ?? rhs.boxPaddingStart,
            boxPaddingEnd: self.boxPaddingEnd ?? rhs.boxPaddingEnd,
            boxPaddingTop: self.boxPaddingTop ?? rhs.boxPaddingTop,
            boxPaddingBottom: self.boxPaddingBottom ?? rhs.boxPaddingBottom,
            startContentPadding: self.startContentPadding ?? rhs.startContentPadding,
            endContentPadding: self.endContentPadding ?? rhs.endContentPadding,
            boxMinHeight: self.boxMinHeight ?? rhs.boxMinHeight,
            alignmentMinHeight: self.alignmentMinHeight ?? rhs.alignmentMinHeight,
            startContentSize: self.startContentSize ?? rhs.startContentSize,
            endContentSize: self.endContentSize ?? rhs.endContentSize,
            valueStyle: self.valueStyle ?? rhs.valueStyle,
            placeholderStyle: self.placeholderStyle ?? rhs.placeholderStyle,
            fieldType: self.fieldType ?? rhs.fieldType,
            indicatorSize: self.indicatorSize ?? rhs.indicatorSize,
            labelColor: self.labelColor ?? rhs.labelColor,
            labelPadding: self.labelPadding ?? rhs.labelPadding,
            labelStyle: self.labelStyle ?? rhs.labelStyle,
            optionalStyle: self.optionalStyle ?? rhs.optionalStyle,
            indicatorOffsetX: self.indicatorOffsetX ?? rhs.indicatorOffsetX,
            indicatorOffsetY: self.indicatorOffsetY ?? rhs.indicatorOffsetY
        )
    }
}

struct TextAreaClearVariation: Codable {
    let id: String
    let parent: String?
    let props: TextAreaClearProps
}

struct TextAreaClearConfiguration: Codable {
    struct Style: Codable {
        let props: TextAreaClearProps
        
        enum Key: String, Codable, CaseIterable {
            case `default`
            case success
            case warning
            case error
        }
    }

    let view: [String: Style]
    let props: TextAreaClearProps
    let variations: [TextAreaClearVariation]
}

extension TextAreaClearConfiguration {
    var allProps: [String: TextAreaClearVariation] {
        var result = [String: TextAreaClearVariation]()
        for variation in self.variations {
            result[variation.id] = variation
        }
        return result
    }
    
    func child(for key: SizeVariationKey, nodes: [TextAreaClearVariationNode]) -> TextAreaClearVariation? {
        return child(props: allProps, key: key, nodes: nodes)
    }
    
    func child(props: [String: TextAreaClearVariation], key: SizeVariationKey, nodes: [TextAreaClearVariationNode]) -> TextAreaClearVariation? {
        let path = ([key.rawValue] + nodes.map { $0.rawValue }).joined(separator: ".")
        return props[path]
    }
}
