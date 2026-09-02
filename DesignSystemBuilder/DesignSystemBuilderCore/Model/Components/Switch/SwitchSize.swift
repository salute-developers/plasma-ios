import Foundation

struct SwitchSize: CodeGenerationSize {
    typealias Props = SwitchProps
    
    var toggleTrackPathDrawer: String?
    var toggleThumbPathDrawer: String?
    var toggleTrackWidth: String?
    var toggleTrackHeight: String?
    var toggleThumbWidth: String?
    var toggleThumbHeight: String?
    var toggleThumbPadding: String?
    var descriptionPadding: String?
    var textPadding: String?
    
    @available(*, deprecated, message: "")
    var width: String?
    
    @available(*, deprecated, message: "")
    var verticalGap: String?
    
    init(variation: ComponentConfiguration<SwitchProps>.Variation, nullify: Bool) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: SwitchProps, id: String? = nil, nullify: Bool = false) {
        self.toggleTrackPathDrawer = PathDrawerContextBuilder(shape: props.toggleTrackShape, nullify: nullify).context
        self.toggleThumbPathDrawer = PathDrawerContextBuilder(shape: props.toggleThumbShape, nullify: nullify).context
        self.toggleTrackWidth = CGFloatContextBuilder(props.toggleTrackWidth?.value, nullify: nullify).context
        self.toggleTrackHeight = CGFloatContextBuilder(props.toggleTrackHeight?.value, nullify: nullify).context
        self.toggleThumbWidth = CGFloatContextBuilder(props.toggleThumbWidth?.value, nullify: nullify).context
        self.toggleThumbHeight = CGFloatContextBuilder(props.toggleThumbHeight?.value, nullify: nullify).context
        self.toggleThumbPadding = CGFloatContextBuilder(props.toggleThumbPadding?.value, nullify: nullify).context
        self.descriptionPadding = CGFloatContextBuilder(props.descriptionPadding?.value, nullify: nullify).context
        self.textPadding = CGFloatContextBuilder(props.textPadding?.value, nullify: nullify).context
        self.width = CGFloat.defaultOptionalContext
        self.verticalGap = CGFloat.defaultContext
    }
    
    init() {
        self.toggleTrackWidth = CGFloat.defaultContext
        self.toggleTrackHeight = CGFloat.defaultContext
        self.toggleThumbWidth = CGFloat.defaultContext
        self.toggleThumbHeight = CGFloat.defaultContext
        self.toggleThumbPadding = CGFloat.defaultContext
        self.textPadding = CGFloat.defaultContext
        self.descriptionPadding = CGFloat.defaultContext
        self.toggleTrackPathDrawer = PathDrawerContextBuilder.defaultContext
        self.toggleThumbPathDrawer = PathDrawerContextBuilder.defaultContext
        self.width = CGFloat.defaultOptionalContext
        self.verticalGap = CGFloat.defaultContext
    }
}
