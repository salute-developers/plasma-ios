import Foundation

struct SegmentAppearance: CodeGenerationAppearance {
    typealias Variation = SegmentConfiguration.Variation
    typealias Props = SegmentProps
    
    var backgroundColor: String?
    var disabledAlpha: String?
    var segmentItemAppearance: String?
    
    init(variation: SegmentConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: SegmentProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.disabledAlpha = CGFloat.defaultContext
        self.backgroundColor = ButtonColorContextBuilder(
            defaultColor: props.backgroundColor,
            highlightedColor: props.backgroundColor?.value(for: [.pressed]),
            hoveredColor: props.backgroundColor?.value(for: [.hovered]),
            selectedColor: props.backgroundColor?.value(for: [.selected])
        ).context
        
        if let segmentItemStyle = props.segmentItemStyle?.value {
            self.segmentItemAppearance = ComponentStyleContextBuilder(segmentItemStyle).context
        }
    }
}
