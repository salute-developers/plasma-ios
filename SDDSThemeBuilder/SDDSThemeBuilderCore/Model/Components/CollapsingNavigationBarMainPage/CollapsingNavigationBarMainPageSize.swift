import Foundation
import SwiftUI

struct CollapsingNavigationBarMainPageSize: CodeGenerationSize {
    typealias Variation = CollapsingNavigationBarMainPageConfiguration.Variation
    typealias Props = CollapsingNavigationBarMainPageProps

    var descriptionPadding: String?
    var descriptionPaddingCollapsed: String?
    var paddingStart: String?
    var paddingEnd: String?
    var paddingTop: String?
    var paddingBottom: String?
    var horizontalSpacing: String?
    var textBlockTopMargin: String?

    init(variation: CollapsingNavigationBarMainPageConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }

    init(props: CollapsingNavigationBarMainPageProps, id: String? = nil, nullify: Bool = false) {
        self.descriptionPadding = CGFloatContextBuilder(props.descriptionPadding?.value, nullify: nullify).context
        self.descriptionPaddingCollapsed = CGFloatContextBuilder(props.descriptionPadding?.value(for: [.collapsed])?.value, nullify: nullify).context
        self.paddingStart = CGFloatContextBuilder(props.paddingStart?.value, nullify: nullify).context
        self.paddingEnd = CGFloatContextBuilder(props.paddingEnd?.value, nullify: nullify).context
        self.paddingTop = CGFloatContextBuilder(props.paddingTop?.value, nullify: nullify).context
        self.paddingBottom = CGFloatContextBuilder(props.paddingBottom?.value, nullify: nullify).context
        self.horizontalSpacing = CGFloatContextBuilder(props.horizontalSpacing?.value, nullify: nullify).context
        self.textBlockTopMargin = CGFloatContextBuilder(props.textBlockTopMargin?.value, nullify: nullify).context
    }

    init() {
        self.descriptionPadding = CGFloat.defaultContext
        self.descriptionPaddingCollapsed = CGFloat.defaultContext
        self.paddingStart = CGFloat.defaultContext
        self.paddingEnd = CGFloat.defaultContext
        self.paddingTop = CGFloat.defaultContext
        self.paddingBottom = CGFloat.defaultContext
        self.horizontalSpacing = CGFloat.defaultContext
        self.textBlockTopMargin = CGFloat.defaultContext
    }
}
