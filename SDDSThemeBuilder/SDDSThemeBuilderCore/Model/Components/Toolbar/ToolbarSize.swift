import Foundation
import SwiftUI

struct ToolbarSize: CodeGenerationSize {
    typealias Variation = ToolbarConfiguration.Variation
    typealias Props = ToolbarProps
    
    var paddingStart: String?
    var paddingEnd: String?
    var paddingTop: String?
    var paddingBottom: String?
    var shape: String?
    var slotPadding: String?
    var dividerMargin: String?
    var orientation: String?
    
    init(variation: ToolbarConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: ToolbarProps, id: String? = nil, nullify: Bool = false) {
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
        self.shape = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
        self.slotPadding = CGFloatContextBuilder(props.slotPadding?.value, nullify: nullify).context
        self.dividerMargin = CGFloatContextBuilder(props.dividerMargin?.value, nullify: nullify).context
        self.orientation = ToolbarOrientationContextBuilder(id: props.orientation?.value, nullify: nullify).context
    }
    
    init() {
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
        self.shape = PathDrawerContextBuilder.defaultContext
        self.slotPadding = CGFloat.defaultContext
        self.dividerMargin = CGFloat.defaultContext
        self.orientation = ToolbarOrientationContextBuilder.defaultContext
    }
}
