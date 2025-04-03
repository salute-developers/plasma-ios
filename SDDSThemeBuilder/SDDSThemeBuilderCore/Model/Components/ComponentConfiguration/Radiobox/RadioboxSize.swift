import Foundation

struct RadioboxSize: CodeGenerationSize {
    typealias Props = RadioboxProps
    
    var toggleWidth: String?
    var toggleHeight: String?
    var toggleCheckedIconWidth: String?
    var toggleCheckedIconHeight: String?
    var toggleCheckedBorderWidth: String?
    var horizontalGap: String?
    var verticalGap: String?
    var pathDrawer: String?
    var lineWidth: String?
    var togglePaddings: String?
    
    init(variation: RadioboxConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: RadioboxProps, id: String? = nil, nullify: Bool = false) {
        self.toggleWidth = CGFloatContextBuilder(props.toggleWidth?.value, nullify: nullify).context
        self.toggleHeight = CGFloatContextBuilder(props.toggleHeight?.value, nullify: nullify).context
        self.toggleCheckedIconWidth = CGFloatContextBuilder(props.toggleIconWidth?.value, nullify: nullify).context
        self.toggleCheckedIconHeight = CGFloatContextBuilder(props.toggleIconHeight?.value, nullify: nullify).context
        self.toggleCheckedBorderWidth = CGFloatContextBuilder(props.toggleCheckedBorderWidth?.value, nullify: nullify).context
        self.horizontalGap = CGFloatContextBuilder(props.textPadding?.value, nullify: nullify).context
        self.verticalGap = CGFloatContextBuilder(props.descriptionPadding?.value, nullify: nullify).context
        self.pathDrawer = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
        self.lineWidth = CGFloatContextBuilder(props.toggleBorderWidth?.value, nullify: nullify).context
        self.togglePaddings = CGFloatContextBuilder(props.togglePadding?.value, nullify: nullify).context
    }
    
    init() {
        self.toggleWidth = CGFloat.defaultContext
        self.toggleHeight = CGFloat.defaultContext
        self.toggleCheckedIconWidth = CGFloat.defaultContext
        self.toggleCheckedIconHeight = CGFloat.defaultContext
        self.toggleCheckedBorderWidth = CGFloat.defaultContext
        self.horizontalGap = CGFloat.defaultContext
        self.verticalGap = CGFloat.defaultContext
        self.pathDrawer = PathDrawerContextBuilder.defaultContext
        self.lineWidth = CGFloat.defaultContext
        self.togglePaddings = CGFloat.defaultContext
    }
}
