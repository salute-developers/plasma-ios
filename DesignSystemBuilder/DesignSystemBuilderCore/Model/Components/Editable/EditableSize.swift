import Foundation
import SwiftUI

struct EditableSize: CodeGenerationSize {
    typealias Props = EditableProps
    
    var iconSize: String?
    var iconMargin: String?
    
    init(variation: EditableConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: EditableProps, id: String? = nil, nullify: Bool = false) {
        self.iconSize = CGFloatContextBuilder(props.iconSize?.value, nullify: nullify).context
        self.iconMargin = CGFloatContextBuilder(props.iconMargin?.value, nullify: nullify).context
    }
    
    init() {
        self.iconSize = CGFloat.defaultContext
        self.iconMargin = CGFloat.defaultContext
    }
}
