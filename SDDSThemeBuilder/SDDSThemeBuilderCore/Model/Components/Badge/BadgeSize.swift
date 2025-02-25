import Foundation
import SwiftUI

struct BadgeSize: CodeGenerationSize {
    typealias Props = BadgeProps
    
    var height: String?
    var cornerRadius: String?
    var startPadding: String?
    var endPadding: String?
    var startContentSize: String?
    var startContentPadding: String?
    var endContentSize: String?
    var endContentPadding: String?
    
    init(variation: BadgeConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: BadgeProps, id: String? = nil, nullify: Bool = false) {
        self.height = CGFloatContextBuilder(props.height?.value, nullify: nullify).context
        self.cornerRadius = ShapeTokenContexBuilder(shape: props.shape, nullify: nullify).context
        self.startPadding = CGFloatContextBuilder(props.startPadding?.value, nullify: nullify).context
        self.endPadding = CGFloatContextBuilder(props.endPadding?.value, nullify: nullify).context
        self.startContentSize = SizeContextBuilder(x: props.startContentSize?.value, y: props.startContentSize?.value, style: .size, nullify: nullify).context
        self.endContentSize = SizeContextBuilder(x: props.endContentSize?.value, y: props.startContentSize?.value, style: .size, nullify: nullify).context
        self.startContentPadding = CGFloatContextBuilder(props.startContentMargin?.value, nullify: nullify).context
        self.endContentPadding = CGFloatContextBuilder(props.endContentMargin?.value, nullify: nullify).context
    }
    
    init() {
        self.height = CGFloat.defaultContext
        self.cornerRadius = CGFloat.defaultContext
        self.startPadding = CGFloat.defaultContext
        self.endPadding = CGFloat.defaultContext
        self.startContentSize = CGSize.defaultContext
        self.endContentSize = CGSize.defaultContext
        self.startContentPadding = CGFloat.defaultContext
        self.endContentPadding = CGFloat.defaultContext
    }
}
