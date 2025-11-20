import Foundation
import SwiftUI

struct DrawerSize: CodeGenerationSize {
    typealias Variation = DrawerConfiguration.Variation
    typealias Props = DrawerProps
    
    var paddingStart: String?
    var paddingEnd: String?
    var paddingTop: String?
    var paddingBottom: String?
    var closeIconHeaderPadding: String?
    var closeIconOffsetX: String?
    var closeIconOffsetY: String?
    var closeIconSize: String?
    var closeIconPlacement: String?
    
    init(variation: DrawerConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: DrawerProps, id: String? = nil, nullify: Bool = false) {
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
        self.closeIconHeaderPadding = CGFloatContextBuilder(props.closeIconHeaderPadding?.value, nullify: nullify).context
        self.closeIconOffsetX = CGFloatContextBuilder(props.closeIconOffsetX?.value, nullify: nullify).context
        self.closeIconOffsetY = CGFloatContextBuilder(props.closeIconOffsetY?.value, nullify: nullify).context
        self.closeIconSize = ImageSizeContextBuilder(props.closeIcon?.value, nullify: nullify).context
        self.closeIconPlacement = DrawerCloseIconPlacementContextBuilder(id: props.closeIconPlacement?.value, component: .drawerCloseInner).context
    }
    
    init() {
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
        self.closeIconHeaderPadding = CGFloat.defaultContext
        self.closeIconOffsetX = CGFloat.defaultContext
        self.closeIconOffsetY = CGFloat.defaultContext
        self.closeIconSize = CGFloat.defaultContext
        self.closeIconPlacement = DrawerCloseIconPlacementContextBuilder.defaultContext
    }
}

