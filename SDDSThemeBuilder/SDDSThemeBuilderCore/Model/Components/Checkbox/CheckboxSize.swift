import Foundation

struct CheckboxSize: CodeGenerationSize {
    typealias Props = CheckboxProps
    
    var width: String?
    var height: String?
    var toggleCheckedIconWidth: String?
    var toggleCheckedIconHeight: String?
    var horizontalGap: String?
    var verticalGap: String?
    var togglePathDrawer: String?
    var lineWidth: String?
    var togglePaddings: String?
    var toggleIndeterminateIconWidth: String?
    var toggleIndeterminateIconHeight: String?
    
    init(variation: ComponentConfiguration<CheckboxProps>.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: CheckboxProps, id: String? = nil, nullify: Bool = false) {
        self.width = CGFloatContextBuilder(props.toggleWidth?.value, nullify: nullify).context
        self.height = CGFloatContextBuilder(props.toggleHeight?.value, nullify: nullify).context
        self.toggleCheckedIconWidth = CGFloatContextBuilder(props.toggleIconWidth?.value, nullify: nullify).context
        self.toggleCheckedIconHeight = CGFloatContextBuilder(props.toggleIconHeight?.value, nullify: nullify).context
        self.horizontalGap = CGFloatContextBuilder(props.textPadding?.value, nullify: nullify).context
        self.verticalGap = CGFloatContextBuilder(props.descriptionPadding?.value, nullify: nullify).context
        self.togglePathDrawer = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
        self.lineWidth = CGFloatContextBuilder(props.toggleBorderWidth?.value, nullify: nullify).context
        self.togglePaddings = CGFloatContextBuilder(props.togglePadding?.value, nullify: nullify).context
        self.toggleCheckedIconWidth = CGFloatContextBuilder(props.toggleIconWidth?.value(for: [.checked]), nullify: nullify).context
        self.toggleCheckedIconHeight = CGFloatContextBuilder(props.toggleIconHeight?.value(for: [.checked]), nullify: nullify).context
        self.toggleIndeterminateIconWidth = CGFloatContextBuilder(props.toggleIconWidth?.value(for: [.indeterminate]), nullify: nullify).context
        self.toggleIndeterminateIconHeight = CGFloatContextBuilder(props.toggleIconHeight?.value(for: [.indeterminate]), nullify: nullify).context
    }
    
    init() {
        self.width = CGFloat.defaultContext
        self.height = CGFloat.defaultContext
        self.toggleCheckedIconWidth = CGFloat.defaultContext
        self.toggleCheckedIconHeight = CGFloat.defaultContext
        self.toggleIndeterminateIconWidth = CGFloat.defaultContext
        self.toggleIndeterminateIconHeight = CGFloat.defaultContext
        self.toggleCheckedIconWidth = CGFloat.defaultContext
        self.toggleCheckedIconHeight = CGFloat.defaultContext
        self.horizontalGap = CGFloat.defaultContext
        self.verticalGap = CGFloat.defaultContext
        self.togglePathDrawer = PathDrawerContextBuilder.defaultContext
        self.lineWidth = CGFloat.defaultContext
        self.togglePaddings = CGFloat.defaultContext
        self.toggleIndeterminateIconWidth = CGFloat.defaultContext
        self.toggleIndeterminateIconHeight = CGFloat.defaultContext
    }
}
