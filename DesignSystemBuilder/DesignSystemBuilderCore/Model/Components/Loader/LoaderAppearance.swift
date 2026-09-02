import Foundation

struct LoaderAppearance: CodeGenerationAppearance {
    typealias Variation = LoaderConfiguration.Variation
    typealias Props = LoaderProps
    
    var spinnerAppearance: String?
    var circularProgressAppearance: String?
    
    init(variation: LoaderConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: LoaderProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        if let spinnerStyle = props.spinnerStyle?.value {
            self.spinnerAppearance = ComponentStyleContextBuilder(spinnerStyle).context
        }
        
        if let circularProgressStyle = props.circularProgressStyle?.value {
            self.circularProgressAppearance = ComponentStyleContextBuilder(circularProgressStyle).context
        }
    }
}
