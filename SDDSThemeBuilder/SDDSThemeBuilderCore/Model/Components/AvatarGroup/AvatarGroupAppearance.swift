import Foundation

struct AvatarGroupAppearance: CodeGenerationAppearance {
    typealias Variation = AvatarGroupConfiguration.Variation
    typealias Props = AvatarGroupProps
    
    var avatarStyle: String? = nil
    
    init(variation: AvatarGroupConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: AvatarGroupProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        if let avatarAppearance = props.avatarStyle?.value {
            self.avatarStyle = ComponentStyleContextBuilder(avatarAppearance).context
        }
    }
}
