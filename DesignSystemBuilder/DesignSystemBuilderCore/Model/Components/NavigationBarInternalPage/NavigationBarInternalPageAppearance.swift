import Foundation

struct NavigationBarInternalPageAppearance: CodeGenerationAppearance {
    typealias Variation = NavigationBarInternalPageConfiguration.Variation
    typealias Props = NavigationBarInternalPageProps
    
    var backIconColor: String?
    var actionStartColor: String?
    var actionEndColor: String?
    var textColor: String?
    var backgroundColor: String?
    var backIcon: String?
    var shadow: String?
    var textTypography: String?
    
    init(variation: NavigationBarInternalPageConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: NavigationBarInternalPageProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        // Цвета
        self.backIconColor = ColorTokenContextBuilder(props.backIconColor).context
        self.actionStartColor = ColorTokenContextBuilder(props.actionStartColor).context
        self.actionEndColor = ColorTokenContextBuilder(props.actionEndColor).context
        self.textColor = ColorTokenContextBuilder(props.textColor).context
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        
        // Иконка
        self.backIcon = ImageContextBuilder(props.backIcon?.value).context
        
        // Тень
        self.shadow = ShadowTokenContextBuilder(shadow: props.shadow).context
        
        // Шрифты
        self.textTypography = TypographyTokenContextBuilder(string: props.textStyle?.value, id: id, component: component).context
    }
}

