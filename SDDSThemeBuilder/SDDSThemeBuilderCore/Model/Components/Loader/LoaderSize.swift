import Foundation
import SwiftUI

struct LoaderSize: CodeGenerationSize {
    typealias Variation = LoaderConfiguration.Variation
    typealias Props = LoaderProps
    
    init(variation: LoaderConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: LoaderProps, id: String? = nil, nullify: Bool = false) {
    }
    
    init() {
    }
}
