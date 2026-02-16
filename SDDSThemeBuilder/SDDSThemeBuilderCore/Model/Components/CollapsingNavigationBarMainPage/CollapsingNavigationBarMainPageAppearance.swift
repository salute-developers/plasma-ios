import Foundation

struct CollapsingNavigationBarMainPageAppearance: CodeGenerationAppearance {
    typealias Variation = CollapsingNavigationBarMainPageConfiguration.Variation
    typealias Props = CollapsingNavigationBarMainPageProps

    var actionStartColor: String?
    var actionEndColor: String?
    var textColor: String?
    var titleColor: String?
    var descriptionColor: String?
    var backgroundColor: String?
    var actionButtonAppearance: String?
    var textTypography: String?
    var titleTypography: String?
    var titleTypographyCollapsed: String?
    var descriptionTypography: String?
    var descriptionTypographyCollapsed: String?

    init(variation: CollapsingNavigationBarMainPageConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }

    init(props: CollapsingNavigationBarMainPageProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }

        // Цвета
        self.actionStartColor = ColorTokenContextBuilder(props.actionStartColor).context
        self.actionEndColor = ColorTokenContextBuilder(props.actionEndColor).context
        self.textColor = ColorTokenContextBuilder(props.textColor).context
        self.titleColor = ColorTokenContextBuilder(props.titleColor).context
        self.descriptionColor = ColorTokenContextBuilder(props.descriptionColor).context
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context

        // Стиль кнопки действия
        if let actionButtonStyle = props.actionButtonStyle?.value {
            self.actionButtonAppearance = ComponentStyleContextBuilder(actionButtonStyle).context
        }

        // Типографика
        self.textTypography = TypographyTokenContextBuilder(string: props.textStyle?.value, id: id, component: component).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.titleStyle?.value, id: id, component: component).context
        self.titleTypographyCollapsed = TypographyTokenContextBuilder(
            string: props.titleStyle?.value(for: [.collapsed])?.value,
            id: id,
            component: component
        ).context
        self.descriptionTypography = TypographyTokenContextBuilder(string: props.descriptionStyle?.value, id: id, component: component).context
        self.descriptionTypographyCollapsed = TypographyTokenContextBuilder(
            string: props.descriptionStyle?.value(for: [.collapsed])?.value,
            id: id,
            component: component
        ).context
    }
}
