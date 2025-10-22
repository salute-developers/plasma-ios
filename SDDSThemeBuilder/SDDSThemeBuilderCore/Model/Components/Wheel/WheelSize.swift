import Foundation
import SwiftUI

struct WheelSize: CodeGenerationSize {
    typealias Variation = WheelConfiguration.Variation
    typealias Props = WheelProps
    
    var itemTextAfterPadding: String?
    var itemMinSpacing: String?
    var descriptionPadding: String?
    var separatorSpacing: String?
    var controlIconUpSize: String?
    var controlIconDownSize: String?
    
    var itemAlignment: String?
    
    init(variation: WheelConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: WheelProps, id: String? = nil, nullify: Bool = false) {
        self.itemTextAfterPadding = CGFloatContextBuilder(props.itemTextAfterPadding?.value, nullify: nullify).context
        self.itemMinSpacing = CGFloatContextBuilder(props.itemMinSpacing?.value, nullify: nullify).context
        self.descriptionPadding = CGFloatContextBuilder(props.descriptionPadding?.value, nullify: nullify).context
        self.separatorSpacing = CGFloatContextBuilder(props.separatorSpacing?.value, nullify: nullify).context
        self.controlIconUpSize = ImageSizeContextBuilder(props.controlIconUp?.value, nullify: nullify).context
        self.controlIconDownSize = ImageSizeContextBuilder(props.controlIconDown?.value, nullify: nullify).context
        
        if let itemAlignment = props.itemAlignment {
            self.itemAlignment = WheelItemAlignmentContextBuilder(
                props: itemAlignment.value,
                component: .wheel
            ).context
        } else {
            self.itemAlignment = WheelItemAlignmentContextBuilder.defaultContext
        }
    }
    
    init() {
        self.itemTextAfterPadding = CGFloat.defaultContext
        self.itemMinSpacing = CGFloat.defaultContext
        self.descriptionPadding = CGFloat.defaultContext
        self.separatorSpacing = CGFloat.defaultContext
        self.controlIconUpSize = CGFloat.defaultContext
        self.controlIconDownSize = CGFloat.defaultContext
        self.itemAlignment = WheelItemAlignmentContextBuilder.defaultContext
    }
}
