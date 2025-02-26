import Foundation
import SwiftUI

struct IndicatorSize: CodeGenerationSize {
    typealias Props = IndicatorProps
    
    var height: String?
    var width: String?
    var functionRect: String?
    
    init(variation: IndicatorConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: IndicatorProps, id: String? = nil, nullify: Bool = false) {
        self.height = CGFloatContextBuilder(props.height?.value, nullify: nullify).context
        self.width = CGFloatContextBuilder(props.height?.value, nullify: nullify).context
        self.functionRect = PathFunctionContextBuilder(shape: props.shape, nullify: nullify).context
    }
    
    init() {
        self.height = CGFloat.defaultContext
        self.width = CGFloat.defaultContext
        self.functionRect = PathFunctionContextBuilder(shape: nil, nullify: false).context
    }
}
