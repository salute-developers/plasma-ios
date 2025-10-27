import Foundation
import SwiftUI

struct NoteCompactSize: CodeGenerationSize {
    typealias Variation = NoteCompactConfiguration.Variation
    typealias Props = NoteCompactProps
    
    var shape: String?
    var iconSize: String?
    var contentBeforeEndMargin: String?
    var paddingStart: String?
    var paddingTop: String?
    var paddingEnd: String?
    var paddingBottom: String?
    var textTopMargin: String?
    var actionStartMargin: String?
    var actionEndMargin: String?
    var closeStartMargin: String?
    var closeSize: String?
    var contentBeforeArrangement: String?
    
    init(variation: NoteCompactConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: NoteCompactProps, id: String? = nil, nullify: Bool = false) {
        self.shape = PathDrawerContextBuilder(shape: props.shape, nullify: nullify).context
        self.iconSize = CGFloatContextBuilder(props.iconSize?.value, nullify: nullify).context
        self.contentBeforeEndMargin = CGFloatContextBuilder(props.contentBeforeEndMargin?.value, nullify: nullify).context
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
        self.textTopMargin = CGFloatContextBuilder(props.textTopMargin?.value, nullify: nullify).context
        self.actionStartMargin = CGFloatContextBuilder(props.actionStartMargin?.value, nullify: nullify).context
        self.actionEndMargin = CGFloatContextBuilder(props.actionEndMargin?.value, nullify: nullify).context
        self.closeStartMargin = CGFloatContextBuilder(props.closeStartMargin?.value, nullify: nullify).context
        self.closeSize = CGFloatContextBuilder(props.closeSize?.value, nullify: nullify).context
        self.contentBeforeArrangement = NoteContentBeforeArrangementContextBuilder(
            id: props.contentBeforeArrangement?.value,
            component: .noteCompact
        ).context
    }
    
    init() {
        self.shape = PathDrawerContextBuilder.defaultContext
        self.iconSize = CGFloat.defaultContext
        self.contentBeforeEndMargin = CGFloat.defaultContext
        self.paddingStart = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
        self.textTopMargin = CGFloat.defaultContext
        self.actionStartMargin = CGFloat.defaultContext
        self.actionEndMargin = CGFloat.defaultContext
        self.closeStartMargin = CGFloat.defaultContext
        self.closeSize = CGFloat.defaultContext
        self.contentBeforeArrangement = NoteContentBeforeArrangementContextBuilder.defaultContext
    }
}

