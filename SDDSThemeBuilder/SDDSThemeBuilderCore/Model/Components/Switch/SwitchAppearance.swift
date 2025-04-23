import Foundation

struct SwitchAppearance: CodeGenerationAppearance {
    typealias Variation = CardConfiguration.Variation
    typealias Props = SwitchProps
    
    var titleTypography: String?
    var subtitleTypography: String?
    var titleColor: String?
    var subtitleColor: String?
    var toggleTrackColor: String?
    var toggleTrackColorChecked: String?
    var toggleTrackBorderColor: String?
    var toggleThumbColor: String?
    var disabledAlpha: String?
    var tintColor: String?
    
    init(variation: SwitchConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: SwitchProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.titleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        self.subtitleTypography = TypographyTokenContextBuilder(string: props.descriptionStyle?.value, id: id, component: component).context
        self.titleColor = ColorTokenContextBuilder(props.labelColor).context
        self.subtitleColor = ColorTokenContextBuilder(props.descriptionColor).context
        self.toggleTrackColor = ColorTokenContextBuilder(props.toggleTrackColor).context
        self.toggleTrackColorChecked = ColorTokenContextBuilder(props.toggleTrackColor?.value(for: [.checked])).context
        self.toggleTrackBorderColor = ColorTokenContextBuilder(props.toggleTrackBorderColor).context
        self.toggleThumbColor = ColorTokenContextBuilder(props.toggleThumbColor).context
        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
        self.tintColor = ColorTokenContextBuilder(nil, nil, hasDefault: true).context
    }
}
