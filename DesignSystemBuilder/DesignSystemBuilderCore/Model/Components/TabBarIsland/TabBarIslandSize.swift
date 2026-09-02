import Foundation
import SwiftUI

struct TabBarIslandSize: CodeGenerationSize {
    typealias Variation = TabBarIslandConfiguration.Variation
    typealias Props = TabBarIslandProps
    
    var topShape: String?
    var bottomShape: String?
    var paddingStart: String?
    var paddingEnd: String?
    var contentPaddingStart: String?
    var contentPaddingEnd: String?
    var contentPaddingTop: String?
    var contentPaddingBottom: String?
    var itemSpacing: String?
    
    init(variation: TabBarIslandConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: TabBarIslandProps, id: String? = nil, nullify: Bool = false) {
        self.topShape = PathDrawerContextBuilder(shape: props.topShape, nullify: nullify).context
        self.bottomShape = PathDrawerContextBuilder(shape: props.bottomShape, nullify: nullify).context
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.contentPaddingStart = CGFloatContextBuilder(props.contentPaddingStart?.value, nullify: nullify).context
        self.contentPaddingEnd = CGFloatContextBuilder(props.contentPaddingEnd?.value, nullify: nullify).context
        self.contentPaddingTop = CGFloatContextBuilder(props.contentPaddingTop?.value, nullify: nullify).context
        self.contentPaddingBottom = CGFloatContextBuilder(props.contentPaddingBottom?.value, nullify: nullify).context
        self.itemSpacing = CGFloatContextBuilder(props.itemSpacing?.value, nullify: nullify).context
    }
    
    init() {
        self.topShape = PathDrawerContextBuilder.defaultContext
        self.bottomShape = PathDrawerContextBuilder.defaultContext
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.contentPaddingStart = CGFloat.defaultContext
        self.contentPaddingEnd = CGFloat.defaultContext
        self.contentPaddingTop = CGFloat.defaultContext
        self.contentPaddingBottom = CGFloat.defaultContext
        self.itemSpacing = CGFloat.defaultContext
    }
}
