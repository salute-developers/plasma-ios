import Foundation

struct NavigationBarMainPageAppearance: CodeGenerationAppearance {
    typealias Variation = NavigationBarMainPageConfiguration.Variation
    typealias Props = NavigationBarMainPageProps
    
    var actionStartColor: String?
    var actionEndColor: String?
    var textColor: String?
    var backgroundColor: String?
    var shadow: String?
    var textTypography: String?
    
    init(variation: NavigationBarMainPageConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: NavigationBarMainPageProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        // Цвета
        self.actionStartColor = ColorTokenContextBuilder(props.actionStartColor).context
        self.actionEndColor = ColorTokenContextBuilder(props.actionEndColor).context
        self.textColor = ColorTokenContextBuilder(props.textColor).context
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        
        // Тень
        self.shadow = ShadowTokenContextBuilder(shadow: props.shadow).context
        
        // Шрифты
        self.textTypography = TypographyTokenContextBuilder(string: props.textStyle?.value, id: id, component: component).context
    }
}

