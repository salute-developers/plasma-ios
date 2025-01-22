import Foundation
import Stencil

final class GenerateTextFieldCommand: Command, FileWriter {
    private let jsonURL: URL
    private let templates: [StencilTemplate]
    private let outputDirectoryURL: URL
    private let templateRender: Renderable

    init(jsonURL: URL,
         templates: [StencilTemplate],
         outputDirectoryURL: URL,
         templateRender: Renderable = TemplateRenderer()) {
        self.jsonURL = jsonURL
        self.templates = templates
        self.outputDirectoryURL = outputDirectoryURL
        self.templateRender = templateRender
        super.init(name: "Generate Swift Code")
    }

    @discardableResult override func run() -> CommandResult {
        super.run()
        
        guard let jsonData = try? Data(contentsOf: jsonURL) else {
            return .error(GeneralError.invalidFilename)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let textFieldSettings = try? decoder.decode(TextFieldConfiguration.self, from: jsonData) else {
            return .error(GeneralError.decoding)
        }
        
        
        
        return .success
    }
    
    func assembleVariations(from settings: TextFieldConfiguration) -> [String: TextFieldVariation] {
        var result: [String: TextFieldVariation] = [:]
        
        // Шаг 1: Идем по всем ключам view и создаем TextFieldVariation из props
        for (key, style) in settings.view {
            // Создаем TextFieldVariation с props из style
            let variation = TextFieldVariation(
                id: key,
                parent: nil, // parent пока не используется
                props: style.props
            )
            result[key] = variation
        }
        
        // Шаг 2: Обновляем каждый TextFieldVariation, добавляя значения из корневого props
        for key in result.keys {
            if let existingVariation = result[key] {
                // Обновляем props, объединяя значения из style.props и settings.props
                let updatedProps = mergeProps(existingVariation.props, with: settings.props)
                result[key] = TextFieldVariation(
                    id: existingVariation.id,
                    parent: existingVariation.parent,
                    props: updatedProps
                )
            }
        }
        
        return result
    }

    // Вспомогательная функция для слияния двух TextFieldProps
    func mergeProps(_ primary: TextFieldProps, with secondary: TextFieldProps) -> TextFieldProps {
        return TextFieldProps(
            disableAlpha: primary.disableAlpha ?? secondary.disableAlpha,
            prefixPadding: primary.prefixPadding ?? secondary.prefixPadding,
            suffixPadding: primary.suffixPadding ?? secondary.suffixPadding,
            optionalPadding: primary.optionalPadding ?? secondary.optionalPadding,
            helperTextPadding: primary.helperTextPadding ?? secondary.helperTextPadding,
            chipsPadding: primary.chipsPadding ?? secondary.chipsPadding,
            captionPlacement: primary.captionPlacement ?? secondary.captionPlacement,
            counterPlacement: primary.counterPlacement ?? secondary.counterPlacement,
            captionStyle: primary.captionStyle ?? secondary.captionStyle,
            counterStyle: primary.counterStyle ?? secondary.counterStyle,
            chipGroupStyle: primary.chipGroupStyle ?? secondary.chipGroupStyle,
            valueColor: primary.valueColor ?? secondary.valueColor,
            startContentColor: primary.startContentColor ?? secondary.startContentColor,
            endContentColor: primary.endContentColor ?? secondary.endContentColor,
            endContentColorReadOnly: primary.endContentColorReadOnly ?? secondary.endContentColorReadOnly,
            optionalColor: primary.optionalColor ?? secondary.optionalColor,
            counterColor: primary.counterColor ?? secondary.counterColor,
            placeholderColor: primary.placeholderColor ?? secondary.placeholderColor,
            backgroundColorReadOnly: primary.backgroundColorReadOnly ?? secondary.backgroundColorReadOnly,
            indicatorColor: primary.indicatorColor ?? secondary.indicatorColor,
            cursorColor: primary.cursorColor ?? secondary.cursorColor,
            captionColorReadOnly: primary.captionColorReadOnly ?? secondary.captionColorReadOnly,
            labelPlacement: primary.labelPlacement ?? secondary.labelPlacement,
            shape: primary.shape ?? secondary.shape,
            chipStyle: primary.chipStyle ?? secondary.chipStyle,
            boxPaddingStart: primary.boxPaddingStart ?? secondary.boxPaddingStart,
            boxPaddingEnd: primary.boxPaddingEnd ?? secondary.boxPaddingEnd,
            boxPaddingTop: primary.boxPaddingTop ?? secondary.boxPaddingTop,
            boxPaddingBottom: primary.boxPaddingBottom ?? secondary.boxPaddingBottom,
            startContentPadding: primary.startContentPadding ?? secondary.startContentPadding,
            endContentPadding: primary.endContentPadding ?? secondary.endContentPadding,
            boxMinHeight: primary.boxMinHeight ?? secondary.boxMinHeight,
            alignmentMinHeight: primary.alignmentMinHeight ?? secondary.alignmentMinHeight,
            startContentSize: primary.startContentSize ?? secondary.startContentSize,
            endContentSize: primary.endContentSize ?? secondary.endContentSize,
            valueStyle: primary.valueStyle ?? secondary.valueStyle,
            placeholderStyle: primary.placeholderStyle ?? secondary.placeholderStyle,
            fieldType: primary.fieldType ?? secondary.fieldType,
            indicatorSize: primary.indicatorSize ?? secondary.indicatorSize,
            labelColor: primary.labelColor ?? secondary.labelColor,
            labelPadding: primary.labelPadding ?? secondary.labelPadding,
            labelStyle: primary.labelStyle ?? secondary.labelStyle,
            optionalStyle: primary.optionalStyle ?? secondary.optionalStyle,
            indicatorOffsetX: primary.indicatorOffsetX ?? secondary.indicatorOffsetX,
            indicatorOffsetY: primary.indicatorOffsetY ?? secondary.indicatorOffsetY
        )
    }

}
