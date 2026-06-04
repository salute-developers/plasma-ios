import Foundation

struct SpinnerAppearance: CodeGenerationAppearance {
    typealias Variation = SpinnerConfiguration.Variation
    typealias Props = SpinnerProps
    
    var backgroundColor: String?
    var strokeCap: String?
    var startColor: String?
    var endColor: String?
    
    init(variation: SpinnerConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: SpinnerProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.backgroundColor = StatefulFillStyleContextBuilder(props.backgroundColor).context
        self.strokeCap = StrokeCapContextBuilder(props.strokeCap?.value).context
        self.startColor = StatefulFillStyleContextBuilder(props.startColor).context
        self.endColor = StatefulFillStyleContextBuilder(props.endColor).context
    }
} 
