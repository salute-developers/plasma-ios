import Foundation

struct TextFieldAppearance: CodeGenerationAppearance {
    typealias Variation = TextFieldConfiguration.Variation
    typealias Props = TextFieldProps
    
    var backgroundColor: String?
    var backgroundColorFocused: String?
    var backgroundColorReadOnly: String?
    var captionColor: String?
    var captionColorFocused: String?
    var captionColorReadOnly: String?
    var cursorColor: String?
    var disabledAlpha: Double?
    let lineColor: String?
    let lineColorFocused: String?
    let lineColorReadOnly: String?
    var endContentColor: String?
    var endContentColorReadonly: String?
    var optionalTitleColor: String?
    var placeholderColor: String?
    var placeholderColorFocused: String?
    var placeholderColorReadOnly: String?
    var requiredIndicatorColor: String?
    var startContentColor: String?
    var textAfterColor: String?
    var textBeforeColor: String?
    var textColor: String?
    var textColorFocused: String?
    var textColorReadOnly: String?
    var titleColor: String?
    var chipAppearance: String?
    var chipGroupAppearance: String?
    var captionTypography: String?
    var innerTitleTypography: String?
    var textTypography: String?
    var textAfterTypography: String?
    var textBeforeTypography: String?
    var titleTypography: String?
    
    init(variation: TextFieldConfiguration.Variation) {
        self.init(props: variation.props, id: variation.id)
    }
    
    init(props: TextFieldProps, id: String? = nil) {
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.backgroundColorFocused = ColorTokenContextBuilder(props.backgroundColor?.value(for: [.activated])).context
        self.backgroundColorReadOnly = ColorTokenContextBuilder(props.backgroundColor).context
        self.captionColor = ColorTokenContextBuilder(props.captionColor).context
        self.captionColorFocused = ColorTokenContextBuilder(props.cursorColor).context
        self.captionColorReadOnly = ColorTokenContextBuilder(props.captionColor).context
        self.cursorColor = ColorTokenContextBuilder(props.cursorColor).context
        self.disabledAlpha = props.disableAlpha?.value
        self.lineColor = ColorTokenContextBuilder(props.dividerColor).context
        self.lineColorFocused = ColorTokenContextBuilder(props.dividerColor?.value(for: [.activated])).context
        self.lineColorReadOnly = ColorTokenContextBuilder(props.dividerColorReadOnly).context
        self.endContentColor = ColorTokenContextBuilder(props.endContentColor).context
        self.endContentColorReadonly = ColorTokenContextBuilder(props.endContentColorReadOnly).context
        self.optionalTitleColor = ColorTokenContextBuilder(props.optionalColor).context
        self.placeholderColor = ColorTokenContextBuilder(props.placeholderColor).context
        self.placeholderColorFocused = ColorTokenContextBuilder(props.placeholderColor?.value(for: [.activated])).context
        self.placeholderColorReadOnly = ColorTokenContextBuilder(props.placeholderColor).context
        self.requiredIndicatorColor = ColorTokenContextBuilder(props.indicatorColor).context
        self.startContentColor = ColorTokenContextBuilder(props.startContentColor).context
        self.textColor = ColorTokenContextBuilder(props.valueColor).context
        self.textColorFocused = ColorTokenContextBuilder(props.valueColor).context
        self.textColorReadOnly = ColorTokenContextBuilder(props.valueColor).context
        self.titleColor = ColorTokenContextBuilder(props.valueColor).context
        self.titleTypography = TypographyTokenContextBuilder(props.labelStyle?.value, id?.baseKey).context
        self.textTypography = TypographyTokenContextBuilder(props.valueStyle?.value, id?.baseKey).context
        self.textBeforeTypography = TypographyTokenContextBuilder(props.valueStyle?.value, id?.baseKey).context
        self.textAfterTypography = TypographyTokenContextBuilder(props.valueStyle?.value, id?.baseKey).context
        self.innerTitleTypography = TypographyTokenContextBuilder(props.labelStyle?.value, id?.baseKey).context
        self.captionTypography = TypographyTokenContextBuilder(props.captionStyle?.value, id?.baseKey).context
        
        if let chipStyle = props.chipStyle?.value {
            self.chipAppearance = ComponentStyleContextBuilder(chipStyle).context
        }
        if let chipGroupStyle = props.chipGroupStyle?.value {
            self.chipGroupAppearance = ComponentStyleContextBuilder(chipGroupStyle).context
        }
        
        self.textAfterColor = optionalTitleColor
        self.textBeforeColor = optionalTitleColor
    }
}
