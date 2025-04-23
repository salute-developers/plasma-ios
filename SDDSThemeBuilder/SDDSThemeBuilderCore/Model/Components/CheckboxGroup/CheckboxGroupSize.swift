import Foundation

struct CheckboxGroupSize: CodeGenerationSize {
    typealias Props = CheckboxGroupProps
    
    var verticalSpacing: String?
    var horizontalIndent: String?
    
    init(variation: ComponentConfiguration<CheckboxGroupProps>.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: CheckboxGroupProps, id: String? = nil, nullify: Bool = false) {
        self.verticalSpacing = CGFloatContextBuilder(props.itemSpacing?.value, nullify: nullify).context
        self.horizontalIndent = CGFloatContextBuilder(props.itemOffset?.value, nullify: nullify).context
    }
    
    init() {
        self.verticalSpacing = CGFloat.defaultContext
        self.horizontalIndent = CGFloat.defaultContext
    }
}
