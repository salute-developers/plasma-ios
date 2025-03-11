import Foundation

struct CardAppearance: CodeGenerationAppearance {
    typealias Variation = CardConfiguration.Variation
    typealias Props = CardProps
    
    public var backgroundColor: String?
    
    init(variation: CardConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: CardProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
    }
}
