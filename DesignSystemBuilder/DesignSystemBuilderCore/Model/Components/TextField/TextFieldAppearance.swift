import Foundation

struct TextFieldAppearance: CodeGenerationAppearance {
    typealias Variation = TextFieldConfiguration.Variation
    typealias Props = TextFieldProps
    
    var backgroundColor: String? = nil
    var backgroundColorReadOnly: String? = nil
    var captionColor: String? = nil
    var captionColorReadOnly: String? = nil
    var cursorColor: String? = nil
    var disabledAlpha: Double? = nil
    var lineColor: String? = nil
    var lineColorReadOnly: String? = nil
    var endContentColor: String? = nil
    var endContentColorReadOnly: String? = nil
    var optionalTitleColor: String? = nil
    var placeholderColor: String? = nil
    var placeholderColorReadOnly: String? = nil
    var requiredIndicatorColor: String? = nil
    var startContentColor: String? = nil
    var startContentColorReadOnly: String? = nil
    var textAfterColor: String? = nil
    var textBeforeColor: String? = nil
    var textColor: String? = nil
    var textColorReadOnly: String? = nil
    var titleColor: String? = nil
    var chipAppearance: String? = nil
    var chipGroupAppearance: String? = nil
    var labelPlacement: String? = nil
    var requiredPlacement: String? = nil
    var captionTypography: String? = nil
    var innerTitleTypography: String? = nil
    var textTypography: String? = nil
    var textAfterTypography: String? = nil
    var textBeforeTypography: String? = nil
    var titleTypography: String? = nil
    
    init(variation: TextFieldConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: TextFieldProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.backgroundColor = StatefulFillStyleContextBuilder(props.backgroundColor).context
        self.backgroundColorReadOnly = ColorTokenContextBuilder(props.backgroundColorReadOnly).context
        self.captionColor = StatefulFillStyleContextBuilder(props.captionColor).context
        self.captionColorReadOnly = ColorTokenContextBuilder(props.captionColorReadOnly).context
        self.cursorColor = ColorTokenContextBuilder(props.cursorColor).context
        self.disabledAlpha = props.disableAlpha?.value
        self.lineColor = StatefulFillStyleContextBuilder(props.dividerColor).context
        self.lineColorReadOnly = ColorTokenContextBuilder(props.dividerColorReadOnly).context
        self.endContentColor = StatefulFillStyleContextBuilder(props.endContentColor).context
        self.endContentColorReadOnly = ColorTokenContextBuilder(props.endContentColorReadOnly).context
        self.optionalTitleColor = ColorTokenContextBuilder(props.optionalColor).context
        self.placeholderColor = StatefulFillStyleContextBuilder(props.placeholderColor).context
        self.placeholderColorReadOnly = ColorTokenContextBuilder(props.placeholderColorReadOnly).context
        self.requiredIndicatorColor = ColorTokenContextBuilder(props.indicatorColor).context
        self.startContentColor = StatefulFillStyleContextBuilder(props.startContentColor).context
        self.startContentColorReadOnly = ColorTokenContextBuilder(props.startContentColorReadOnly).context
        self.textColor = StatefulFillStyleContextBuilder(props.valueColor).context
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
