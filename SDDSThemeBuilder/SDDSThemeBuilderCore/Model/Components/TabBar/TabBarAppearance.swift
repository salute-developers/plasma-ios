import Foundation

struct TabBarAppearance: CodeGenerationAppearance {
    typealias Variation = TabBarConfiguration.Variation
    typealias Props = TabBarProps
    
    var backgroundColor: String?
    var shadow: String?
    var dividerColor: String?
    var tabBarItemAppearance: String?
    
    init(variation: TabBarConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: TabBarProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.shadow = ShadowTokenContextBuilder(shadow: props.shadow).context
        self.dividerColor = ColorTokenContextBuilder(props.dividerColor).context
        
        if let tabBarItemStyle = props.tabBarItemStyle?.value {
            self.tabBarItemAppearance = ComponentStyleContextBuilder(tabBarItemStyle).context
        }
    }
}
