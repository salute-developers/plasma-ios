import Foundation

struct CollapsingNavigationBarInternalPageAppearance: CodeGenerationAppearance {
    typealias Variation = CollapsingNavigationBarInternalPageConfiguration.Variation
    typealias Props = CollapsingNavigationBarInternalPageProps

    var backIconColor: String?
    var actionStartColor: String?
    var actionEndColor: String?
    var textColor: String?
    var titleColor: String?
    var descriptionColor: String?
    var backgroundColor: String?
    var backIcon: String?
    var actionButtonAppearance: String?
    var textTypography: String?
    var titleTypography: String?
    var titleTypographyCollapsed: String?
    var descriptionTypography: String?
    var descriptionTypographyCollapsed: String?

    init(variation: CollapsingNavigationBarInternalPageConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }

    init(props: CollapsingNavigationBarInternalPageProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }

        // Цвета
        self.backIconColor = StatefulFillStyleContextBuilder(props.backIconColor).context
        self.actionStartColor = StatefulFillStyleContextBuilder(props.actionStartColor).context
        self.actionEndColor = StatefulFillStyleContextBuilder(props.actionEndColor).context
        self.textColor = StatefulFillStyleContextBuilder(props.textColor).context
        self.titleColor = StatefulFillStyleContextBuilder(props.titleColor).context
        self.descriptionColor = StatefulFillStyleContextBuilder(props.descriptionColor).context
        self.backgroundColor = StatefulFillStyleContextBuilder(props.backgroundColor).context

        // Иконка
        self.backIcon = ImageContextBuilder(props.backIcon?.value).context

        // Стиль кнопки действия
        if let actionButtonStyle = props.actionButtonStyle?.value {
            self.actionButtonAppearance = ComponentStyleContextBuilder(actionButtonStyle).context
        }

        // Типографика
        self.textTypography = TypographyTokenContextBuilder(string: props.textStyle?.value, id: id, component: component).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.titleStyle?.value, id: id, component: component).context
        self.titleTypographyCollapsed = TypographyTokenContextBuilder(
            string: props.titleStyle?.value(for: .collapsed)?.value,
            id: id,
            component: component
        ).context
        self.descriptionTypography = TypographyTokenContextBuilder(string: props.descriptionStyle?.value, id: id, component: component).context
        self.descriptionTypographyCollapsed = TypographyTokenContextBuilder(
            string: props.descriptionStyle?.value(for: .collapsed)?.value,
            id: id,
            component: component
        ).context
    }
}
