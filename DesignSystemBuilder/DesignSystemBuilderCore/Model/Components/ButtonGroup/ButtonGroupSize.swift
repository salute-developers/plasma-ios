import Foundation
import SwiftUI

struct ButtonGroupSize: CodeGenerationSize {
    typealias Props = ButtonGroupProps
    
    var spacing: String?
    var externalShape: String?
    var internalShape: String?
    
    init(variation: ButtonGroupConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: ButtonGroupProps, id: String? = nil, nullify: Bool = false) {
        self.spacing = CGFloatContextBuilder(props.spacing?.value, nullify: nullify).context
        self.externalShape = PathDrawerContextBuilder(shape: props.externalShape, nullify: nullify).context
        self.internalShape = PathDrawerContextBuilder(shape: props.internalShape, nullify: nullify).context
    }
    
    init() {
        self.spacing = CGFloat.defaultContext
        self.externalShape = PathDrawerContextBuilder.defaultContext
        self.internalShape = PathDrawerContextBuilder.defaultContext
    }
}
