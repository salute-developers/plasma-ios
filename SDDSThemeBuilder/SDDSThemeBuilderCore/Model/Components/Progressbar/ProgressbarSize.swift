import Foundation
import SwiftUI

struct ProgressbarSize: CodeGenerationSize {
    typealias Props = ProgressbarProps
    
    var indicatorShape: String?
    var backgroundShape: String?
    var backgroundHeight: String?
    var indicatorHeight: String?
    
    init(variation: ProgressbarConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: ProgressbarProps, id: String? = nil, nullify: Bool = false) {
        self.indicatorShape = PathDrawerContextBuilder(shape: props.indicatorShape, nullify: nullify).context
        self.backgroundShape = PathDrawerContextBuilder(shape: props.backgroundShape, nullify: nullify).context
        self.backgroundHeight = CGFloatContextBuilder(props.backgroundHeight?.value, nullify: nullify).context
        self.indicatorHeight = CGFloatContextBuilder(props.indicatorHeight?.value, nullify: nullify).context
    }
    
    init() {
        self.indicatorShape = PathDrawerContextBuilder.defaultContext
        self.backgroundShape = PathDrawerContextBuilder.defaultContext
        self.backgroundHeight = CGFloat.defaultContext
        self.indicatorHeight = CGFloat.defaultContext
    }
}
