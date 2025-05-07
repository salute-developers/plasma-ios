import Foundation

struct CircularProgressBarAppearance: CodeGenerationAppearance {
    typealias Variation = CircularProgressBarConfiguration.Variation
    typealias Props = CircularProgressBarProps
    
    var valueColor: String?
    var valueEnabled: String?
    var trackColor: String?
    var valueTypography: String?
    var indicatorColor: String?
    
    init(variation: CircularProgressBarConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: CircularProgressBarProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.valueColor = ColorTokenContextBuilder(props.valueColor).context
        self.valueEnabled = BoolContextBuilder(props.valueEnabled?.value, nullify: true).context
        self.trackColor = ColorTokenContextBuilder(props.trackColor).context
        self.valueTypography = TypographyTokenContextBuilder(string: props.valueStyle?.value, id: id, component: component).context
        self.indicatorColor = FillStyleContextBuilder(props.indicatorColor, hasDefault: false).context
    }
} 
