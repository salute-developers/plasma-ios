import Foundation

struct ChipGroupAppearance: CodeGenerationAppearance {
    typealias Variation = ChipGroupConfiguration.Variation
    typealias Props = ChipGroupProps
    
    var chipAppearance: String? = nil
    var disabledAlpha: String? = nil
    
    init(variation: ChipGroupConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: ChipGroupProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        self.disabledAlpha = CGFloatContextBuilder(props.disableAlpha?.value, nullify: true).context
        if let chipStyle = props.chipStyle?.value {
            self.chipAppearance = ComponentStyleContextBuilder(chipStyle).context
        }
    }
}
