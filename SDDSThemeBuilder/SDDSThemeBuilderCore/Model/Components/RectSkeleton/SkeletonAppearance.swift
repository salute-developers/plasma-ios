import Foundation

struct SkeletonAppearance: CodeGenerationAppearance {
    typealias Variation = SkeletonConfiguration.Variation
    typealias Props = SkeletonProps
    
    var shape: String?
    var gradient: String?
    var duration: String?
    
    init(variation: SkeletonConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: SkeletonProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.shape = PathDrawerContextBuilder(shape: props.shape).context
        self.gradient = ColorTokenContextBuilder(props.gradient, isGradient: true).context
        self.duration = CGFloatContextBuilder(props.duration?.value).context
    }
} 
