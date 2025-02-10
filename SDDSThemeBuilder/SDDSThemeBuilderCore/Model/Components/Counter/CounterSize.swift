import Foundation
import SwiftUI

struct CounterSize: CodeGenerationSize {
    typealias Props = CounterProps
    
    var width: String?
    var height: String?
    var paddings: String?
    
    init(variation: ComponentConfiguration<CounterProps>.Variation, nullify: Bool) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: CounterProps, id: String? = nil, nullify: Bool = false) {
        self.width = CGFloatContextBuilder(props.minWidth?.value, nullify: nullify).context
        self.height = CGFloatContextBuilder(props.minHeight?.value, nullify: nullify).context
        self.paddings = EdgeInsetsContextBuilder(top: props.paddingTop?.value, leading: props.paddingLeft?.value, bottom: props.paddingBottom?.value, trailing: props.paddingRight?.value, nullify: nullify).context
    }
    
    init() {
        self.width = CGFloat.defaultContext
        self.height = CGFloat.defaultContext
        self.paddings = EdgeInsets.defaultContext
    }
}
