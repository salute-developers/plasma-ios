import Foundation
import SwiftUI

struct TabBarItemSize: CodeGenerationSize {
    typealias Variation = TabBarItemConfiguration.Variation
    typealias Props = TabBarItemProps
    
    var minHeight: String?
    var paddingTop: String?
    var paddingBottom: String?
    var iconSize: String?
    var labelPadding: String?
    var shape: String?
    var labelPlacement: String?
    
    init(variation: TabBarItemConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: TabBarItemProps, id: String? = nil, nullify: Bool = false) {
        self.minHeight = CGFloatContextBuilder(props.minHeight?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
        if let iconSizeString = props.iconSize?.value, let iconSizeDouble = Double(iconSizeString) {
            self.iconSize = CGFloatContextBuilder(iconSizeDouble, nullify: nullify).context
        } else {
            self.iconSize = nullify ? nil : CGFloat.defaultContext
        }
        self.labelPadding = CGFloatContextBuilder(props.labelPadding?.value, nullify: nullify).context
        if let shape = props.shape {
            self.shape = PathDrawerContextBuilder(shape: shape, nullify: true).context
        } else {
            self.shape = PathDrawerContextBuilder.defaultContext
        }
        self.labelPlacement = TabBarLabelPlacementContextBuilder(id: props.labelPlacement?.value, component: .tabBarItemSolid).context
    }
    
    init() {
        self.minHeight = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
        self.iconSize = CGFloat.defaultContext
        self.labelPadding = CGFloat.defaultContext
        self.shape = PathDrawerContextBuilder.defaultContext
        self.labelPlacement = TabBarLabelPlacementContextBuilder.defaultContext
    }
}
