import Foundation
import SwiftUI

struct NavigationBarInternalPageSize: CodeGenerationSize {
    typealias Variation = NavigationBarInternalPageConfiguration.Variation
    typealias Props = NavigationBarInternalPageProps
    
    var backIconMargin: String?
    var paddingStart: String?
    var paddingEnd: String?
    var paddingTop: String?
    var paddingBottom: String?
    var horizontalSpacing: String?
    var textBlockTopMargin: String?
    var bottomShape: String?
    
    init(variation: NavigationBarInternalPageConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: NavigationBarInternalPageProps, id: String? = nil, nullify: Bool = false) {
        self.backIconMargin = CGFloatContextBuilder(props.backIconMargin?.value, nullify: nullify).context
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
        self.horizontalSpacing = CGFloatContextBuilder(props.horizontalSpacing?.value, nullify: nullify).context
        self.textBlockTopMargin = CGFloatContextBuilder(props.textBlockTopMargin?.value, nullify: nullify).context
        self.bottomShape = PathDrawerContextBuilder(shape: props.bottomShape, nullify: nullify).context
    }
    
    init() {
        self.backIconMargin = CGFloat.defaultContext
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
        self.horizontalSpacing = CGFloat.defaultContext
        self.textBlockTopMargin = CGFloat.defaultContext
        self.bottomShape = PathDrawerContextBuilder.defaultContext
    }
}

