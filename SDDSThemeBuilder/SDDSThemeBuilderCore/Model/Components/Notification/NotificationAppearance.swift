import Foundation

struct NotificationAppearance: CodeGenerationAppearance {
    typealias Props = NotificationProps
    
    var backgroundColor: String?
    var closeColor: String?
    
    init(variation: ComponentConfiguration<NotificationProps>.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: NotificationProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.closeColor = ColorTokenContextBuilder(props.closeColor).context
    }
}
