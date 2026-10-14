import Foundation

struct BottomSheetAppearance: CodeGenerationAppearance {
    typealias Variation = BottomSheetConfiguration.Variation
    typealias Props = BottomSheetProps
    
    var backgroundColor: String?
    var handleColor: String?
    var handlePlacement: String?
    
    init(variation: BottomSheetConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: BottomSheetProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.handleColor = ColorTokenContextBuilder(props.handleColor).context
        self.handlePlacement = BottomSheetHandlePlacementContextBuilder(props.handlePlacement?.value ?? "").context
    }
}
