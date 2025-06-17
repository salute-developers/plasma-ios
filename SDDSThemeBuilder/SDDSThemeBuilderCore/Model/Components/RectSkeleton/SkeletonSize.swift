import Foundation

struct SkeletonSize: CodeGenerationSize {
    typealias Props = SkeletonProps
    
    init(variation: SkeletonConfiguration.Variation, nullify: Bool) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: SkeletonProps, id: String?, nullify: Bool) {}
    
    init() {}
} 
