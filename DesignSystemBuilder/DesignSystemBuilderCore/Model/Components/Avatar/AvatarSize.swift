import Foundation
import SwiftUI

struct AvatarSize: CodeGenerationSize {
    typealias Variation = CellConfiguration.Variation
    typealias Props = AvatarProps
    
    var avatarSize: String?
    var statusInsets: String?
    var extraOffset: String?
    var pathDrawer: String?
    
    init(variation: AvatarConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: AvatarProps, id: String? = nil, nullify: Bool = false) {
        self.avatarSize = SizeContextBuilder(x: props.width?.value, y: props.height?.value, style: .size, nullify: nullify).context
        self.statusInsets = EdgeInsetsContextBuilder(top: 0, leading: 0, bottom: props.statusOffsetY?.value, trailing: props.statusOffsetX?.value, nullify: nullify).context
        self.extraOffset = SizeContextBuilder(x: props.extraOffsetX?.value, y: props.extraOffsetY?.value, nullify: nullify).context
        self.pathDrawer = PathDrawerContextBuilder(shape: props.shape, nullify: true).context
    }
    
    init() {
        self.avatarSize = CGSize.defaultContext
        self.statusInsets = EdgeInsets.defaultContext
        self.extraOffset = CGPoint.defaultContext
        self.pathDrawer = PathDrawerContextBuilder.defaultContext
    }
}
