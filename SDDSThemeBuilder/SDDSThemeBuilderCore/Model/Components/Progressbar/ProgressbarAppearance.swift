import Foundation

struct ProgressbarAppearance: CodeGenerationAppearance {
    typealias Variation = ProgressbarConfiguration.Variation
    typealias Props = ProgressbarProps
    
    var indicatorColor: ColorKeyValue?
    var backgroundColor: ColorKeyValue?
    
    init(variation: ProgressbarConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: ProgressbarProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.indicatorColor = 
        self.backgroundColor =
    }
}
