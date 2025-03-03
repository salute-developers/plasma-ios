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
    var endContentColorReadOnly: String?
    var optionalTitleColor: String?
    var placeholderColor: String?
    var placeholderColorFocused: String?
    var placeholderColorReadOnly: String?
    var requiredIndicatorColor: String?
    var startContentColor: String?
    var startContentColorReadOnly: String?
    var startContentColorFocused: String?
    var textAfterColor: String?
    var textBeforeColor: String?
    var textColor: String?
    var textColorFocused: String?
    var textColorReadOnly: String?
    var titleColor: String?
    var chipAppearance: String?
    var chipGroupAppearance: String?
    var labelPlacement: String?
    var requiredPlacement: String?
    var captionTypography: String?
    var innerTitleTypography: String?
    var textTypography: String?
    var textAfterTypography: String?
    var textBeforeTypography: String?
    var titleTypography: String?
    
    init(variation: TextFieldConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: TextFieldProps, id: String? = nil, component: CodeGenerationComponent) {
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.backgroundColorFocused = ColorTokenContextBuilder(props.backgroundColor?.value(for: [.activated])).context
        self.backgroundColorReadOnly = ColorTokenContextBuilder(props.backgroundColorReadOnly).context
        self.captionColor = ColorTokenContextBuilder(props.captionColor).context
        self.captionColorFocused = ColorTokenContextBuilder(props.captionColor?.value(for: [.activated])).context
        self.captionColorReadOnly = ColorTokenContextBuilder(props.captionColorReadOnly).context
        self.cursorColor = ColorTokenContextBuilder(props.cursorColor).context
        self.disabledAlpha = props.disableAlpha?.value
        self.lineColor = ColorTokenContextBuilder(props.dividerColor).context
        self.lineColorFocused = ColorTokenContextBuilder(props.dividerColor?.value(for: [.activated])).context
        self.lineColorReadOnly = ColorTokenContextBuilder(props.dividerColorReadOnly).context
        self.endContentColor = ColorTokenContextBuilder(props.endContentColor).context
        self.endContentColorReadOnly = ColorTokenContextBuilder(props.endContentColorReadOnly).context
        self.optionalTitleColor = ColorTokenContextBuilder(props.optionalColor).context
        self.placeholderColor = ColorTokenContextBuilder(props.placeholderColor).context
        self.placeholderColorFocused = ColorTokenContextBuilder(props.placeholderColor?.value(for: [.activated])).context
        self.placeholderColorReadOnly = ColorTokenContextBuilder(props.placeholderColorReadOnly).context
        self.requiredIndicatorColor = ColorTokenContextBuilder(props.indicatorColor).context
        self.startContentColor = ColorTokenContextBuilder(props.startContentColor).context
        self.startContentColorReadOnly = ColorTokenContextBuilder(props.startContentColorReadOnly).context
        self.startContentColorFocused = ColorTokenContextBuilder(props.startContentColor?.value(for: [.activated])).context
        self.textColor = ColorTokenContextBuilder(props.valueColor).context
        self.textColorFocused = ColorTokenContextBuilder(props.valueColor?.value(for: [.activated])).context
        self.textColorReadOnly = ColorTokenContextBuilder(props.valueColorReadOnly).context
        self.titleColor = ColorTokenContextBuilder(props.labelColor).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        self.textTypography = TypographyTokenContextBuilder(string: props.valueStyle?.value, id: id, component: component).context
        self.textBeforeTypography = TypographyTokenContextBuilder(string: props.valueStyle?.value, id: id, component: component).context
        self.textAfterTypography = TypographyTokenContextBuilder(string: props.valueStyle?.value, id: id, component: component).context
        self.innerTitleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        self.captionTypography = TypographyTokenContextBuilder(string: props.captionStyle?.value, id: id, component: component).context
        self.labelPlacement = LabelPlacementContextBuilder(id: id, component: .textField).context
        self.requiredPlacement = RequiredPlacementContextBuilder(id: id, component: .textField).context
        
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
