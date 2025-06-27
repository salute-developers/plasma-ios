import Foundation

struct AvatarGroupSize: CodeGenerationSize {
    typealias Props = AvatarGroupProps
    
    var spacing: String?
    var borderWidth: String?

    init(variation: ComponentConfiguration<AvatarGroupProps>.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: AvatarGroupProps, id: String? = nil, nullify: Bool = false) {
        self.spacing = CGFloatContextBuilder(props.itemOffset?.value, nullify: nullify).context
        self.borderWidth = CGFloatContextBuilder(props.itemSpacing?.value, nullify: nullify).context
    }
    
    init() {
        self.spacing = CGFloat.defaultContext
        self.borderWidth = CGFloat.defaultContext
    }
}
