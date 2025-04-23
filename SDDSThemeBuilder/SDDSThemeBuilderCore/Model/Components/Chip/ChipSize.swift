import Foundation
import SwiftUI

struct ChipSize: CodeGenerationSize {
    typealias Props = ChipProps
    
    var height: String?
    var cornerRadius: String?
    var iconImageSize: String?
    var buttonImageSize: String?
    var contentStartPadding: String?
    var contentEndPadding: String?
    var leadingInset: String?
    var trailingInset: String?
    
    init(variation: ChipConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: ChipProps, id: String? = nil, nullify: Bool = false) {
        self.height = CGFloatContextBuilder(props.height?.value, nullify: nullify).context
        self.leadingInset = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.trailingInset = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.contentStartPadding = CGFloatContextBuilder(props.contentStartPadding?.value, nullify: nullify).context
        self.contentEndPadding = CGFloatContextBuilder(props.contentEndPadding?.value, nullify: nullify).context
        self.cornerRadius = ShapeTokenContexBuilder(shape: props.shape, nullify: nullify).context
        self.iconImageSize = SizeContextBuilder(x: props.contentStartSize?.value, y: props.contentStartSize?.value, style: .size, nullify: nullify).context
        self.buttonImageSize = SizeContextBuilder(x: props.contentEndSize?.value, y: props.contentEndSize?.value, style: .size, nullify: nullify).context
    }
    
    init() {
        self.height = CGFloat.defaultContext
        self.cornerRadius = CGFloat.defaultContext
        self.leadingInset = CGFloat.defaultContext
        self.trailingInset = CGFloat.defaultContext
        self.contentStartPadding = CGFloat.defaultContext
        self.contentEndPadding = CGFloat.defaultContext
        self.iconImageSize = CGSize.defaultContext
        self.buttonImageSize = CGSize.defaultContext
    }
}
