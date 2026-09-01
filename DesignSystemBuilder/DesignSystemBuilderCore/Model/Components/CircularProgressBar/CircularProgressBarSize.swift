import Foundation

struct CircularProgressBarSize: CodeGenerationSize {
    typealias Props = CircularProgressBarProps
    
    var width: String?
    var height: String?
    var trackThickness: String?
    var progressThickness: String?
    
    init(variation: CircularProgressBarConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: CircularProgressBarProps, id: String? = nil, nullify: Bool = false) {
        self.width = CGFloatContextBuilder(props.width?.value, nullify: nullify).context
        self.height = CGFloatContextBuilder(props.height?.value, nullify: nullify).context
        self.trackThickness = CGFloatContextBuilder(props.trackThickness?.value, nullify: nullify).context
        self.progressThickness = CGFloatContextBuilder(props.progressThickness?.value, nullify: nullify).context
    }
    
    init() {
        self.width = CGFloat.defaultContext
        self.height = CGFloat.defaultContext
        self.trackThickness = CGFloat.defaultContext
        self.progressThickness = CGFloat.defaultContext
    }
} 