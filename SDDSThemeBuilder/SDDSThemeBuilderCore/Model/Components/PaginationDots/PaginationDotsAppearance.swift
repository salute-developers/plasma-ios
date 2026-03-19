import Foundation

struct PaginationDotsAppearance: CodeGenerationAppearance {
    typealias Variation = PaginationDotsConfiguration.Variation
    typealias Props = PaginationDotsProps
    
    var dotBackgroundColor: String?
    var dotBackgroundColorActivated: String?
    
    init(variation: PaginationDotsConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: PaginationDotsProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props else { return }
        
        self.dotBackgroundColor = ColorTokenContextBuilder(props.dotBackgroundColor).context
        self.dotBackgroundColorActivated = ColorTokenContextBuilder(
            props.dotBackgroundColor?.value(for: [.activated])
        ).context
    }
}
