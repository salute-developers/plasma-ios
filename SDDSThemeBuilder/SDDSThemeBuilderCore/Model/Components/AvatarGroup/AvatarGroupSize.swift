import Foundation

struct AvatarGroupSize: CodeGenerationSize {
    typealias Props = AvatarGroupProps
    
    var itemOffset: String?
    var itemSpacing: String?

    init(variation: AvatarGroupConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: AvatarGroupProps, id: String? = nil, nullify: Bool = false) {
        self.itemOffset = CGFloatContextBuilder(props.itemOffset?.value, nullify: nullify).context
        self.itemSpacing = CGFloatContextBuilder(props.itemSpacing?.value, nullify: nullify).context
    }
    
    init() {
        self.itemOffset = CGFloat.defaultContext
        self.itemSpacing = CGFloat.defaultContext
    }
}
