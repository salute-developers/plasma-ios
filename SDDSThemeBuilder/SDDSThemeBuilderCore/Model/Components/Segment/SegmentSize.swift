import Foundation
import SwiftUI

struct SegmentSize: CodeGenerationSize {
    typealias Props = SegmentProps
    
    var horizontalHeight: String?
    var verticalWidth: String?
    var paddings: String?
    var pathDrawer: String?
    
    init(variation: SegmentConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: SegmentProps, id: String? = nil, nullify: Bool = false) {
        self.horizontalHeight = CGFloat.defaultContext
        self.verticalWidth = CGFloat.defaultContext
        self.paddings = EdgeInsetsContextBuilder(
            top: props.paddingTop?.value ?? 0,
            leading: props.paddingStart?.value ?? 0,
            bottom: props.paddingBottom?.value ?? 0,
            trailing: props.paddingEnd?.value ?? 0,
            nullify: nullify
        ).context
        self.pathDrawer = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
    }
    
    init() {
        self.horizontalHeight = CGFloat.defaultContext
        self.verticalWidth = CGFloat.defaultContext
        self.paddings = EdgeInsets.defaultContext
        self.pathDrawer = PathDrawerContextBuilder.defaultContext
    }
}
