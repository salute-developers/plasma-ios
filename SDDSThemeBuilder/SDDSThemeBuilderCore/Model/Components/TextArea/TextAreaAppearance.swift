import Foundation

struct TextAreaAppearance: CodeGenerationAppearance {
    typealias Variation = TextFieldConfiguration.Variation
    typealias Props = TextFieldProps
    
    var backgroundColor: String? = nil
    var backgroundColorFocused: String? = nil
    var backgroundColorReadOnly: String? = nil
    var captionColor: String? = nil
    var captionColorFocused: String? = nil
    var captionColorReadOnly: String? = nil
    var cursorColor: String? = nil
    var disabledAlpha: Double? = nil
    var endContentColor: String? = nil
    var endContentColorReadOnly: String? = nil
    var optionalTitleColor: String? = nil
    var placeholderColor: String? = nil
    var placeholderColorFocused: String? = nil
    var placeholderColorReadOnly: String? = nil
    var requiredIndicatorColor: String? = nil
    var startContentColor: String? = nil
    var startContentColorReadOnly: String? = nil
    var textColor: String? = nil
    var textColorFocused: String? = nil
    var textColorReadOnly: String? = nil
    var titleColor: String? = nil
    var titleColorFocused: String? = nil
    var counterColor: String? = nil
    var lineColor: String? = nil
    var lineColorFocused: String? = nil
    var lineColorReadOnly: String? = nil
    var chipAppearance: String? = nil
    var chipGroupAppearance: String? = nil
    var labelPlacement: String? = nil
    var requiredPlacement: String? = nil
    var captionTypography: String? = nil
    var counterTypography: String? = nil
    var innerTitleTypography: String? = nil
    var textTypography: String? = nil
    var titleTypography: String? = nil
    
    init(variation: TextFieldConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: TextFieldProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.backgroundColorFocused = ColorTokenContextBuilder(props.backgroundColor?.value(for: [.activated])).context
        self.backgroundColorReadOnly = ColorTokenContextBuilder(props.backgroundColorReadOnly).context
        self.captionColor = ColorTokenContextBuilder(props.captionColor).context
        self.captionColorFocused = ColorTokenContextBuilder(props.captionColor?.value(for: [.activated])).context
        self.captionColorReadOnly = ColorTokenContextBuilder(props.captionColorReadOnly).context
        self.cursorColor = ColorTokenContextBuilder(props.cursorColor).context
        self.disabledAlpha = props.disableAlpha?.value
        self.endContentColor = ColorTokenContextBuilder(props.endContentColor).context
        self.endContentColorReadOnly = ColorTokenContextBuilder(props.endContentColorReadOnly).context
        self.optionalTitleColor = ColorTokenContextBuilder(props.optionalColor).context
        self.placeholderColor = ColorTokenContextBuilder(props.placeholderColor).context
        self.placeholderColorFocused = ColorTokenContextBuilder(props.placeholderColor?.value(for: [.activated])).context
        self.placeholderColorReadOnly = ColorTokenContextBuilder(props.placeholderColorReadOnly).context
        self.requiredIndicatorColor = ColorTokenContextBuilder(props.indicatorColor).context
        self.startContentColor = ColorTokenContextBuilder(props.startContentColor).context
        self.textColor = ColorTokenContextBuilder(props.valueColor).context
        self.textColorFocused = ColorTokenContextBuilder(props.valueColor?.value(for: [.activated])).context
        self.textColorReadOnly = ColorTokenContextBuilder(props.valueColorReadOnly).context
        self.titleColor = ColorTokenContextBuilder(props.labelColor).context
        self.counterColor = ColorTokenContextBuilder(props.counterColor).context
        self.lineColor = ColorTokenContextBuilder(props.dividerColor).context
        self.lineColorFocused = ColorTokenContextBuilder(props.dividerColor?.value(for: [.activated])).context
        self.lineColorReadOnly = ColorTokenContextBuilder(props.dividerColorReadOnly).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        self.textTypography = TypographyTokenContextBuilder(string: props.valueStyle?.value, id: id, component: component).context
        self.innerTitleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        self.captionTypography = TypographyTokenContextBuilder(string: props.captionStyle?.value, id: id, component: component).context
        self.counterTypography = TypographyTokenContextBuilder(string: props.counterStyle?.value, id: id, component: component).context
        self.labelPlacement = LabelPlacementContextBuilder(id: id, component: .textArea).context
        self.requiredPlacement = RequiredPlacementContextBuilder(id: id, component: .textArea).context

        if let chipStyle = props.chipStyle?.value {
            self.chipAppearance = ComponentStyleContextBuilder(chipStyle).context
        }
        if let chipGroupStyle = props.chipGroupStyle?.value {
            self.chipGroupAppearance = ComponentStyleContextBuilder(chipGroupStyle).context
        }
    }
}
