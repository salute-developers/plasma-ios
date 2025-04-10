import Foundation

struct ProgressBarAppearance: CodeGenerationAppearance {
    typealias Variation = ProgressBarConfiguration.Variation
    typealias Props = ProgressBarProps
    
    var tintFillStyle: String? = nil
    var trackColor: String? = nil
    var height: String? = nil
    var indicatorHeight: String? = nil
    var indicatorCornerRadius: String? = nil
    var cornerRadius: String? = nil
    
    init(variation: ProgressBarConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: ProgressBarProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        self.height = CGFloatContextBuilder(props.backgroundHeight?.value, nullify: true).context
        self.indicatorHeight = CGFloatContextBuilder(props.indicatorHeight?.value, nullify: true).context
        self.indicatorCornerRadius = PathDrawerContextBuilder(shape: props.indicatorShape, nullify: true).context
        self.cornerRadius = PathDrawerContextBuilder(shape: props.backgroundShape, nullify: true).context
        self.tintFillStyle = FillStyleContextBuilder(props.indicatorColor, hasDefault: true).context
        self.trackColor = ColorTokenContextBuilder(props.backgroundColor, hasDefault: true).context
    }
}
