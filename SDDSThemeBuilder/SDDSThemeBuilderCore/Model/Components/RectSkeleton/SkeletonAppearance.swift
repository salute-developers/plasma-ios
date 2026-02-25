import Foundation

struct SkeletonAppearance: CodeGenerationAppearance {
    typealias Variation = SkeletonConfiguration.Variation
    typealias Props = SkeletonProps
    
    var shape: String?
    var gradient: String?
    var duration: String?
    var textTypography: String?
    
    init(variation: SkeletonConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: SkeletonProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        if let shape = props.shape {
            self.shape = PathDrawerContextBuilder(shape: shape).context
        }
        self.gradient = FillStyleContextBuilder(props.gradient).context
        if let duration = props.duration?.value {
            self.duration = CGFloatContextBuilder(duration).context
        }
        self.textTypography = TypographyTokenContextBuilder(string: props.textStyle?.value, id: id, component: component).context
    }
} 
