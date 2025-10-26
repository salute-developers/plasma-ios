import Foundation
import SwiftUI

struct NoteSize: CodeGenerationSize {
    typealias Variation = NoteConfiguration.Variation
    typealias Props = NoteProps
    
    var shape: String?
    var titlePaddingEnd: String?
    var iconSize: String?
    var contentBeforeEndMargin: String?
    var paddingStart: String?
    var paddingTop: String?
    var paddingEnd: String?
    var paddingBottom: String?
    var textTopMargin: String?
    var actionTopMargin: String?
    var closeTopMargin: String?
    var closeEndMargin: String?
    var closeSize: String?
    var contentBeforeArrangement: String?
    
    init(variation: NoteConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: NoteProps, id: String? = nil, nullify: Bool = false) {
        self.shape = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
        self.titlePaddingEnd = CGFloatContextBuilder(props.titlePaddingEnd?.value, nullify: nullify).context
        self.iconSize = CGFloatContextBuilder(props.iconSize?.value, nullify: nullify).context
        self.contentBeforeEndMargin = CGFloatContextBuilder(props.contentBeforeEndMargin?.value, nullify: nullify).context
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
        self.textTopMargin = CGFloatContextBuilder(props.textTopMargin?.value, nullify: nullify).context
        self.actionTopMargin = CGFloatContextBuilder(props.actionTopMargin?.value, nullify: nullify).context
        self.closeTopMargin = CGFloatContextBuilder(props.closeTopMargin?.value, nullify: nullify).context
        self.closeEndMargin = CGFloatContextBuilder(props.closeEndMargin?.value, nullify: nullify).context
        self.closeSize = CGFloatContextBuilder(props.closeSize?.value, nullify: nullify).context
        self.contentBeforeArrangement = NoteContentBeforeArrangementContextBuilder(
            id: props.contentBeforeArrangement?.value,
            component: .note
        ).context
    }
    
    init() {
        self.shape = PathDrawerContextBuilder.defaultContext
        self.titlePaddingEnd = CGFloat.defaultContext
        self.iconSize = CGFloat.defaultContext
        self.contentBeforeEndMargin = CGFloat.defaultContext
        self.paddingStart = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
        self.textTopMargin = CGFloat.defaultContext
        self.actionTopMargin = CGFloat.defaultContext
        self.closeTopMargin = CGFloat.defaultContext
        self.closeEndMargin = CGFloat.defaultContext
        self.closeSize = CGFloat.defaultContext
        self.contentBeforeArrangement = NoteContentBeforeArrangementContextBuilder.defaultContext
    }
}


