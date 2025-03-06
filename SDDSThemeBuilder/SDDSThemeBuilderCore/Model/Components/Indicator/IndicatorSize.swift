import Foundation
import SwiftUI

struct IndicatorSize: CodeGenerationSize {
    typealias Props = IndicatorProps
    
    var height: String?
    var width: String?
    var pathDrawer: String?
    
    init(variation: IndicatorConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: IndicatorProps, id: String? = nil, nullify: Bool = false) {
        self.height = CGFloatContextBuilder(props.height?.value, nullify: nullify).context
        self.width = CGFloatContextBuilder(props.height?.value, nullify: nullify).context
        self.pathDrawer = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
    }
    
    init() {
        self.height = CGFloat.defaultContext
        self.width = CGFloat.defaultContext
        self.pathDrawer = PathDrawerContextBuilder.defaultContext
    }
}
