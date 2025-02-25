import Foundation

struct IndicatorAppearance: CodeGenerationAppearance {
    typealias Variation = IndicatorConfiguration.Variation
    typealias Props = IndicatorProps
    
    var backgroundColor: String? = nil
    
    init(variation: IndicatorConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: IndicatorProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
    }
}
