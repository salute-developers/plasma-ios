import Foundation
import SwiftUI

struct ButtonSize: CodeGenerationSize {
    typealias Props = ButtonProps
    
    var height: String?
    var cornerRadius: String?
    var paddings: String?
    var iconSize: String?
    var spinnerSize: String?
    var titleHorizontalGap: String?
    var iconHorizontalGap: String?
    
    init(variation: ButtonConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: ButtonProps, id: String? = nil, nullify: Bool = false) {
        self.height = CGFloatContextBuilder(props.height?.value, nullify: nullify).context
        self.titleHorizontalGap = CGFloatContextBuilder(props.valueMargin?.value, nullify: nullify).context
        self.iconHorizontalGap = CGFloatContextBuilder(props.iconMargin?.value, nullify: nullify).context
        self.cornerRadius = ShapeTokenContextBuilder(shape: props.shape, nullify: nullify).context
        self.paddings = EdgeInsetsContextBuilder(top: nil, leading: props.paddingStart?.value, bottom: nil, trailing: props.paddingEnd?.value, nullify: nullify).context
        self.iconSize = SizeContextBuilder(x: props.iconSize?.value, y: props.iconSize?.value, style: .size, nullify: nullify).context
        self.spinnerSize = SizeContextBuilder(x: props.spinnerSize?.value, y: props.spinnerSize?.value, style: .size, nullify: nullify).context
    }
    
    init() {
        self.height = CGFloat.defaultContext
        self.cornerRadius = CGFloat.defaultContext
        self.titleHorizontalGap = CGFloat.defaultContext
        self.iconHorizontalGap = CGFloat.defaultContext
        self.paddings = EdgeInsets.defaultContext
        self.iconSize = CGSize.defaultContext
        self.spinnerSize = CGSize.defaultContext
    }
}
