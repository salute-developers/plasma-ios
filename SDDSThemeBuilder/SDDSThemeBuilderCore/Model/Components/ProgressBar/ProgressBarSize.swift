import Foundation
import SwiftUI

struct ProgressBarSize: CodeGenerationSize {
    typealias Props = ProgressBarProps
    
    var height: String?
    var indicatorHeight: String?
    var indicatorCornerRadius: String?
    var cornerRadius: String?
    
    init(variation: ProgressBarConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: ProgressBarProps, id: String? = nil, nullify: Bool = false) {
        self.height = CGFloatContextBuilder(props.backgroundHeight?.value, nullify: nullify).context
        self.indicatorHeight = CGFloatContextBuilder(props.indicatorHeight?.value, nullify: nullify).context
        self.indicatorCornerRadius = PathDrawerContextBuilder(shape: props.indicatorShape, nullify: nullify).context
        self.cornerRadius = PathDrawerContextBuilder(shape: props.backgroundShape, nullify: nullify).context
    }
    
    init() {
        self.height = CGFloat.defaultContext
        self.indicatorHeight = CGFloat.defaultContext
        self.indicatorCornerRadius = PathDrawerContextBuilder.defaultContext
        self.cornerRadius = PathDrawerContextBuilder.defaultContext
    }
}
