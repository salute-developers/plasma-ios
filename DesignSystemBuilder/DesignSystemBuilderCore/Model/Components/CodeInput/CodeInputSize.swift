import Foundation
import SwiftUI

struct CodeInputSize: CodeGenerationSize {
    typealias Variation = CodeInputConfiguration.Variation
    typealias Props = CodeInputProps
    
    var itemHeight: String?
    var itemWidth: String?
    var dotSize: String?
    var strokeWidth: String?
    var itemSpacing: String?
    var groupSpacing: String?
    var captionPadding: String?
    
    init(variation: CodeInputConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: CodeInputProps, id: String? = nil, nullify: Bool = false) {
        self.itemHeight = CGFloatContextBuilder(props.itemHeight?.value, nullify: nullify).context
        self.itemWidth = CGFloatContextBuilder(props.itemWidth?.value, nullify: nullify).context
        self.dotSize = CGFloatContextBuilder(props.dotSize?.value, nullify: nullify).context
        self.strokeWidth = CGFloatContextBuilder(props.strokeWidth?.value, nullify: nullify).context
        self.itemSpacing = CGFloatContextBuilder(props.itemSpacing?.value, nullify: nullify).context
        self.groupSpacing = CGFloatContextBuilder(props.groupSpacing?.value, nullify: nullify).context
        self.captionPadding = CGFloatContextBuilder(props.captionPadding?.value, nullify: nullify).context
    }
    
    init() {
        self.itemHeight = CGFloat.defaultContext
        self.itemWidth = CGFloat.defaultContext
        self.dotSize = CGFloat.defaultContext
        self.strokeWidth = CGFloat.defaultContext
        self.itemSpacing = CGFloat.defaultContext
        self.groupSpacing = CGFloat.defaultContext
        self.captionPadding = CGFloat.defaultContext
    }
}
