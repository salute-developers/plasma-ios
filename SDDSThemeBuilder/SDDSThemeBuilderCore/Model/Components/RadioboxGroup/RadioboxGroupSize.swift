import Foundation

struct RadioboxGroupSize: CodeGenerationSize {
    typealias Props = RadioboxGroupProps
    
    var verticalSpacing: String? = nil
    
    init(variation: ComponentConfiguration<RadioboxGroupProps>.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: RadioboxGroupProps, id: String? = nil, nullify: Bool = false) {
        self.verticalSpacing = CGFloatContextBuilder(props.itemSpacing?.value, nullify: nullify).context
    }
    
    init() {
        self.verticalSpacing = CGFloat.defaultContext
    }
}
