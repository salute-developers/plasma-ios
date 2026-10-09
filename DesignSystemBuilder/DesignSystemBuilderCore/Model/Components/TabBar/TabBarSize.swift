import Foundation
import SwiftUI

struct TabBarSize: CodeGenerationSize {
    typealias Variation = TabBarConfiguration.Variation
    typealias Props = TabBarProps
    
    var contentPaddingStart: String?
    var contentPaddingEnd: String?
    var contentPaddingTop: String?
    var contentPaddingBottom: String?
    var itemSpacing: String?
    var topShape: String?
    var bottomShape: String?
    var paddingStart: String?
    var paddingEnd: String?
    var dividerThickness: String?
    
    init(variation: TabBarConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: TabBarProps, id: String? = nil, nullify: Bool = false) {
        self.contentPaddingStart = CGFloatContextBuilder(props.contentPaddingStart?.value, nullify: nullify).context
        self.contentPaddingEnd = CGFloatContextBuilder(props.contentPaddingEnd?.value, nullify: nullify).context
        self.contentPaddingTop = CGFloatContextBuilder(props.contentPaddingTop?.value, nullify: nullify).context
        self.contentPaddingBottom = CGFloatContextBuilder(props.contentPaddingBottom?.value, nullify: nullify).context
        self.itemSpacing = CGFloatContextBuilder(props.itemSpacing?.value, nullify: nullify).context
        self.topShape = PathDrawerContextBuilder(shape: props.topShape, nullify: nullify).context
        self.bottomShape = PathDrawerContextBuilder(shape: props.bottomShape, nullify: nullify).context
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.dividerThickness = CGFloatContextBuilder(props.dividerThickness?.value, nullify: nullify).context
    }
    
    init() {
        self.contentPaddingStart = CGFloat.defaultContext
        self.contentPaddingEnd = CGFloat.defaultContext
        self.contentPaddingTop = CGFloat.defaultContext
        self.contentPaddingBottom = CGFloat.defaultContext
        self.itemSpacing = CGFloat.defaultContext
        self.topShape = PathDrawerContextBuilder.defaultContext
        self.bottomShape = PathDrawerContextBuilder.defaultContext
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.dividerThickness = CGFloat.defaultContext
    }
}
