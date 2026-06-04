import Foundation

struct ChipAppearance: CodeGenerationAppearance {
    typealias Variation = ChipConfiguration.Variation
    typealias Props = ChipProps
    
    var titleColor: String? = nil
    var titleTypography: String? = nil
    var imageTintColor: String? = nil
    var buttonTintColor: String? = nil
    var disabledAlpha: String? = nil
    var backgroundColor: String? = nil
    
    init(variation: ChipConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: ChipProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
        self.backgroundColor = StatefulFillStyleContextBuilder(props.backgroundColor).context
        self.imageTintColor = StatefulFillStyleContextBuilder(props.contentStartColor).context
        self.buttonTintColor = StatefulFillStyleContextBuilder(props.contentEndColor).context
        self.titleColor = StatefulFillStyleContextBuilder(props.labelColor).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
    }
}
