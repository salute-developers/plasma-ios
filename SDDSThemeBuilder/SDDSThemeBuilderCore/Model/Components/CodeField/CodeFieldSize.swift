import Foundation
import SwiftUI

struct CodeFieldSize: CodeGenerationSize {
    typealias Props = CodeFieldProps
    
    var itemSpacing: String?
    var groupSpacing: String?
    var itemShape: String?
    var groupShape: String?
    var captionSpacing: String?
    var width: String?
    var height: String?
    
    init(variation: CodeFieldConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: CodeFieldProps, id: String? = nil, nullify: Bool = false) {
        self.itemSpacing = CGFloatContextBuilder(props.itemSpacing?.value, nullify: nullify).context
        self.groupSpacing = CGFloatContextBuilder(props.groupSpacing?.value, nullify: nullify).context
        self.itemShape = PathDrawerContextBuilder(shape: props.itemShape, nullify: nullify).context
        self.groupShape = PathDrawerContextBuilder(shape: props.groupShape, nullify: nullify).context
        self.captionSpacing = CGFloatContextBuilder(props.captionSpacing?.value, nullify: nullify).context
        self.width = CGFloatContextBuilder(props.width?.value, nullify: nullify).context
        self.height = CGFloatContextBuilder(props.height?.value, nullify: nullify).context
    }
    
    init() {
        self.itemSpacing = CGFloat.defaultContext
        self.groupSpacing = CGFloat.defaultContext
        self.itemShape = PathDrawerContextBuilder.defaultContext
        self.groupShape = PathDrawerContextBuilder.defaultContext
        self.captionSpacing = CGFloat.defaultContext
        self.width = CGFloat.defaultContext
        self.height = CGFloat.defaultContext
    }
}
