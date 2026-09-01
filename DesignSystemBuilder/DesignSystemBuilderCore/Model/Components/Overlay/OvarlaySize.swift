import Foundation

struct OverlaySize: CodeGenerationSize {
    typealias Props = OverlayProps
    
    init(variation: OverlayConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: OverlayProps, id: String? = nil, nullify: Bool = false) {}
    
    init() {}
}
