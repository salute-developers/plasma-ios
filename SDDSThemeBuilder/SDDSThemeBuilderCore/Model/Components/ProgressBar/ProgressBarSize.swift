import Foundation
import SwiftUI

struct ProgressBarSize: CodeGenerationSize {
    typealias Props = ProgressBarProps
    
    var height: String?
    var indicatorHeight: String?
    var indicatorPathDrawer: String?
    var pathDrawer: String?
    var cornerRadius: String?
    var indicatorCornerRadius: String?
    
    init(variation: ComponentConfiguration<ProgressBarProps>.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: ProgressBarProps, id: String? = nil, nullify: Bool = false) {
        self.height = CGFloatContextBuilder(props.backgroundHeight?.value, nullify: nullify).context
        self.indicatorHeight = CGFloatContextBuilder(props.indicatorHeight?.value, nullify: nullify).context
        self.indicatorPathDrawer = PathDrawerContextBuilder(shape: props.indicatorShape, nullify: nullify).context
        self.pathDrawer = PathDrawerContextBuilder(shape: props.backgroundShape, nullify: nullify).context
        self.cornerRadius = CGFloat.defaultContext
        self.indicatorCornerRadius = CGFloat.defaultContext
    }
    
    init() {
        self.height = CGFloat.defaultContext
        self.indicatorHeight = CGFloat.defaultContext
        self.indicatorPathDrawer = PathDrawerContextBuilder.defaultContext
        self.pathDrawer = PathDrawerContextBuilder.defaultContext
        self.cornerRadius = CGFloat.defaultContext
        self.indicatorCornerRadius = CGFloat.defaultContext
    }
}
