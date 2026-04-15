import Foundation

struct SegmentItemAppearance: CodeGenerationAppearance {
    typealias Variation = SegmentItemConfiguration.Variation
    typealias Props = SegmentItemProps
    
    var backgroundColor: String?
    var disabledAlpha: String?
    var startContentColor: String?
    var endContentColor: String?
    var subtitleColor: String?
    var titleColor: String?
    var titleTypography: String?
    var subtitleTypography: String?
    var counterAppearance: String?
    
    init(variation: SegmentItemConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: SegmentItemProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
        self.backgroundColor = ButtonColorContextBuilder(statefulColor: props.backgroundColor).context
        self.startContentColor = ButtonColorContextBuilder(statefulColor: props.startContentColor).context
        self.endContentColor = ButtonColorContextBuilder(statefulColor: props.endContentColor).context
        self.titleColor = ButtonColorContextBuilder(statefulColor: props.labelColor).context
        self.subtitleColor = ButtonColorContextBuilder(statefulColor: props.valueColor).context
        self.subtitleTypography = TypographyTokenContextBuilder(string: props.valueStyle?.value, id: id, component: component).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        
        if let counterStyleValue = props.counterStyle?.value {
            var updatedAppearance: CounterAppearance? = nil
            if let counterStyleProps = props.counterStyle?.props {
                updatedAppearance = CounterAppearance(props: counterStyleProps, component: .counter)
            }
            let updatedAppearanceContext = updatedAppearance?.context(with: ComponentStyleContextBuilder(counterStyleValue).context ?? "")
            self.counterAppearance = ComponentStyleContextBuilder(counterStyleValue, appearance: updatedAppearanceContext).context
        }
    }
}
