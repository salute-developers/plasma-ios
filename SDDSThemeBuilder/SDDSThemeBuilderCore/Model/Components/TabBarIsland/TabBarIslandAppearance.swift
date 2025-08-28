import Foundation

struct TabBarIslandAppearance: CodeGenerationAppearance {
    typealias Variation = TabBarIslandConfiguration.Variation
    typealias Props = TabBarIslandProps
    
    var backgroundColor: String?
    var shadow: String?
    var tabBarItemAppearance: String?
    
    init(variation: TabBarIslandConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: TabBarIslandProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.shadow = ShadowTokenContextBuilder(shadow: props.shadow).context
        
        if let tabBarItemStyle = props.tabBarItemStyle?.value {
            self.tabBarItemAppearance = ComponentStyleContextBuilder(tabBarItemStyle).context
        }
    }
}
