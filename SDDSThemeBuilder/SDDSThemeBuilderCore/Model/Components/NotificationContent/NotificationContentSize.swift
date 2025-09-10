import Foundation
import SwiftUI

struct NotificationContentSize: CodeGenerationSize {
    typealias Variation = NotificationContentConfiguration.Variation
    typealias Props = NotificationContentProps
    
    var iconSize: String?
    var buttonGroupTopPadding: String?
    var textPadding: String?
    var textBoxBottomPadding: String?
    var contentTopPadding: String?
    var contentStartPadding: String?
    var contentEndPadding: String?
    var iconMargin: String?
    var textBoxStartPadding: String?
    var textBoxTopPadding: String?
    var buttonGroupStartPadding: String?
    
    init(variation: NotificationContentConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: NotificationContentProps, id: String? = nil, nullify: Bool = false) {
        self.iconSize = CGFloatContextBuilder(props.iconSize?.value, nullify: nullify).context
        self.buttonGroupTopPadding = CGFloatContextBuilder(props.buttonGroupTopPadding?.value, nullify: nullify).context
        self.textPadding = CGFloatContextBuilder(props.textPadding?.value, nullify: nullify).context
        self.textBoxBottomPadding = CGFloatContextBuilder(props.textBoxBottomPadding?.value, nullify: nullify).context
        self.contentTopPadding = CGFloatContextBuilder(props.contentTopPadding?.value, nullify: nullify).context
        self.contentStartPadding = CGFloatContextBuilder(props.contentStartPadding?.value, nullify: nullify).context
        self.contentEndPadding = CGFloatContextBuilder(props.contentEndPadding?.value, nullify: nullify).context
        self.iconMargin = CGFloatContextBuilder(props.iconMargin?.value, nullify: nullify).context
        self.textBoxStartPadding = CGFloatContextBuilder(props.textBoxStartPadding?.value, nullify: nullify).context
        self.textBoxTopPadding = CGFloatContextBuilder(props.textBoxTopPadding?.value, nullify: nullify).context
        self.buttonGroupStartPadding = CGFloatContextBuilder(props.buttonGroupStartPadding?.value, nullify: nullify).context
    }
    
    init() {
        self.iconSize = CGFloat.defaultContext
        self.buttonGroupTopPadding = CGFloat.defaultContext
        self.textPadding = CGFloat.defaultContext
        self.textBoxBottomPadding = CGFloat.defaultContext
        self.contentTopPadding = CGFloat.defaultContext
        self.contentStartPadding = CGFloat.defaultContext
        self.contentEndPadding = CGFloat.defaultContext
        self.iconMargin = CGFloat.defaultContext
        self.textBoxStartPadding = CGFloat.defaultContext
        self.textBoxTopPadding = CGFloat.defaultContext
        self.buttonGroupStartPadding = CGFloat.defaultContext
    }
}
