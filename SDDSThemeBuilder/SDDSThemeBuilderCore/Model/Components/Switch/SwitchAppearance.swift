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
        self.titleColor = StatefulFillStyleContextBuilder(props.labelColor, hasDefault: true).context
        self.subtitleColor = StatefulFillStyleContextBuilder(props.descriptionColor, hasDefault: true).context
        self.toggleTrackColor = StatefulFillStyleContextBuilder(props.toggleTrackColor, hasDefault: true).context
        self.toggleTrackColorChecked = StatefulFillStyleContextBuilder(props.toggleTrackColor, hasDefault: true).context
        self.toggleTrackBorderColor = StatefulFillStyleContextBuilder(props.toggleTrackBorderColor, hasDefault: true).context
        self.toggleThumbColor = StatefulFillStyleContextBuilder(props.toggleThumbColor, hasDefault: true).context
        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
        self.tintColor = StatefulFillStyleContextBuilder(nil, hasDefault: true).context
    }
}
