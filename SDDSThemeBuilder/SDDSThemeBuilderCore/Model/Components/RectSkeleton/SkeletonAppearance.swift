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
        
        if let shape = props.shape {
            self.shape = PathDrawerContextBuilder(shape: shape).context
        }
        if let gradient = props.gradient {
            self.gradient = ColorTokenContextBuilder(gradient, isGradient: true).context
        }
        if let duration = props.duration?.value {
            self.duration = CGFloatContextBuilder(duration).context
        }
    }
} 
