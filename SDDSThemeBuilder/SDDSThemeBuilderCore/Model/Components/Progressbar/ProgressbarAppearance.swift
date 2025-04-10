import Foundation

struct ProgressbarAppearance: CodeGenerationAppearance {
    typealias Variation = ProgressbarConfiguration.Variation
    typealias Props = ProgressbarProps
    
    var indicatorColor: String? = nil
    var backgroundColor: String? = nil
    
    init(variation: ProgressbarConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: ProgressbarProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.indicatorColor = FillStyleContextBuilder(props.indicatorColor, hasDefault: true).context
        self.backgroundColor = FillStyleContextBuilder(props.indicatorColor, hasDefault: true).context
    }
}
