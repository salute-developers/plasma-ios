import Foundation
import SwiftUI

struct SpinnerSize: CodeGenerationSize {
    typealias Props = SpinnerProps
    
    var size: String?
    var padding: String?
    
    init(variation: SpinnerConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: SpinnerProps, id: String? = nil, nullify: Bool = false) {
        self.size = CGFloatContextBuilder(props.size?.value, nullify: nullify).context
        self.padding = CGFloatContextBuilder(props.padding?.value, nullify: nullify).context
    }
    
    init() {
        self.size = CGFloat.defaultContext
        self.padding = CGFloat.defaultContext
    }
} 