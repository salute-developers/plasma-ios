import Foundation

struct NotificationContentAppearance: CodeGenerationAppearance {
    typealias Variation = NotificationContentConfiguration.Variation
    typealias Props = NotificationContentProps
    
    var iconColor: String?
    var titleColor: String?
    var textColor: String?
    var titleTypography: String?
    var textTypography: String?
    var buttonGroupAppearance: String?
    var buttonLayout: String?
    var iconPlacement: String?
    
    init(variation: NotificationContentConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: NotificationContentProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        self.iconColor = ColorTokenContextBuilder(props.iconColor).context
        self.titleColor = ColorTokenContextBuilder(props.titleColor).context
        self.textColor = ColorTokenContextBuilder(props.textColor).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.titleStyle?.value, id: id, component: component).context
        self.textTypography = TypographyTokenContextBuilder(string: props.textStyle?.value, id: id, component: component).context
        
        if let buttonGroupStyle = props.buttonGroupStyle?.value {
            self.buttonGroupAppearance = ComponentStyleContextBuilder(buttonGroupStyle).context
        }
        
        self.buttonLayout = NotificationContentButtonLayoutContextBuilder(id: props.buttonLayout?.value, component: .notificationContent).context
        self.iconPlacement = NotificationContentIconPlacementContextBuilder(id: props.iconPlacement?.value, component: .notificationContent).context
    }
}
