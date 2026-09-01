import Foundation
import SwiftUI

struct ChipGroupSize: CodeGenerationSize {
    typealias Props = ChipGroupProps
    
    var gap: String?
    var lineSpacing: String?
    var funcinsets: String?
    var maxColumns: String?
    var alignment: String?
    
    
    init(variation: ChipGroupConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: ChipGroupProps, id: String? = nil, nullify: Bool = false) {
        self.gap = CGFloatContextBuilder(props.gap?.value, nullify: nullify).context
        self.lineSpacing = CGFloatContextBuilder(props.lineSpacing?.value, nullify: nullify).context
        self.maxColumns = Int.defaultContext
        self.alignment = "ChipGroupAlignment.left"
        self.funcinsets = "(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }"
    }
    
    init() {
        self.gap = CGFloat.defaultContext
        self.lineSpacing = CGFloat.defaultContext
        self.maxColumns = Int.defaultContext
        self.alignment = "ChipGroupAlignment.left"
        self.funcinsets = "(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }"
    }
}
