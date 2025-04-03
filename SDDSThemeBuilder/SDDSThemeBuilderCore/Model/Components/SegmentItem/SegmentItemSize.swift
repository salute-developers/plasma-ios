import Foundation
import SwiftUI

struct SegmentItemSize: CodeGenerationSize {
    typealias Props = SegmentItemProps
    
    var height: String?
    var width: String?
    var cornerRadius: String?
    var paddings: String?
    var iconSize: String?
    var startContentSize: String?
    var endContentSize: String?
    var titleHorizontalGap: String?
    var iconHorizontalGap: String?
    var counterPadding: String?
    
    init(variation: SegmentItemConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: SegmentItemProps, id: String? = nil, nullify: Bool = false) {
        self.height = CGFloatContextBuilder(props.minHeight?.value, nullify: nullify).context
        self.width = CGFloatContextBuilder(props.minWidth?.value, nullify: nullify).context
        self.titleHorizontalGap = CGFloatContextBuilder(props.valueMargin?.value, nullify: nullify).context
        self.iconHorizontalGap = CGFloatContextBuilder(props.iconMargin?.value, nullify: nullify).context
        self.counterPadding = CGFloatContextBuilder(props.counterMargin?.value, nullify: nullify).context
        self.cornerRadius = ShapeTokenContexBuilder(shape: props.shape, nullify: nullify).context
        self.paddings = EdgeInsetsContextBuilder(top: nil, leading: props.paddingStart?.value, bottom: nil, trailing: props.paddingEnd?.value, nullify: nullify).context
        self.iconSize = SizeContextBuilder(x: props.startContentSize?.value, y: props.startContentSize?.value, style: .size, nullify: nullify).context
        self.startContentSize = SizeContextBuilder(x: props.startContentSize?.value, y: props.startContentSize?.value, style: .size, nullify: nullify).context
        self.endContentSize = SizeContextBuilder(x: props.startContentSize?.value, y: props.endContentSize?.value, style: .size, nullify: nullify).context
    }
    
    init() {
        self.height = CGFloat.defaultContext
        self.width = CGFloat.defaultContext
        self.cornerRadius = CGFloat.defaultContext
        self.titleHorizontalGap = CGFloat.defaultContext
        self.iconHorizontalGap = CGFloat.defaultContext
        self.paddings = EdgeInsets.defaultContext
        self.iconSize = CGSize.defaultContext
        self.startContentSize = CGSize.defaultContext
        self.endContentSize = CGSize.defaultContext
        self.counterPadding = CGFloat.defaultContext
    }
}
