import Foundation

struct DividerAppearance: CodeGenerationAppearance {
    typealias Variation = DividerConfiguration.Variation
    typealias Props = DividerProps
    
    var shape: String?
    var thickness: String?
    var backgroundColor: String?
    
    init(variation: DividerConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: DividerProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.shape = PathDrawerContextBuilder(shape: props.shape).context
        self.thickness = CGFloatContextBuilder(props.thickness?.value).context
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
    }
}
