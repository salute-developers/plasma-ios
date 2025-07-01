import Foundation

struct ScrollbarAppearance: CodeGenerationAppearance {
    typealias Variation = ScrollbarConfiguration.Variation
    typealias Props = ScrollbarProps
    
    var thumbColor: String?
    var trackColor: String?
    
    init(variation: ScrollbarConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: ScrollbarProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.thumbColor = ColorTokenContextBuilder(props.thumbColor).context
        self.trackColor = ColorTokenContextBuilder(props.trackColor).context
    }
} 
