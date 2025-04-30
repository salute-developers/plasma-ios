import Foundation

struct ProgressBarAppearance: CodeGenerationAppearance {
    typealias Variation = ProgressBarConfiguration.Variation
    typealias Props = ProgressBarProps
    
    var tintFillStyle: String? = nil
    var trackColor: String? = nil
    var disabledAlpha: String? = nil
    
    init(variation: ProgressBarConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: ProgressBarProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        self.tintFillStyle = FillStyleContextBuilder(props.indicatorColor, hasDefault: true).context
        self.trackColor = ColorTokenContextBuilder(props.backgroundColor, hasDefault: true).context
        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
    }
}
