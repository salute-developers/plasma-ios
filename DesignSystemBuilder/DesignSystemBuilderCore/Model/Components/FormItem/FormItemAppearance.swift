import Foundation

struct FormItemAppearance: CodeGenerationAppearance {
    typealias Variation = FormItemConfiguration.Variation
    typealias Props = FormItemProps

    var disableAlpha: Double?

    var hintIcon: String?
    var hintColor: String?

    var titleColor: String?
    var titleTypography: String?
    var titlePlacement: String?

    var optionalColor: String?
    var optionalTypography: String?

    var titleCaptionColor: String?
    var titleCaptionTypography: String?

    var captionColor: String?
    var captionTypography: String?

    var counterColor: String?
    var counterTypography: String?

    var formType: String?
    var topTextAlignment: String?
    var bottomTextAlignment: String?
    var indicatorAlignment: String?
    var indicatorAlignmentMode: String?
    var indicatorAppearance: String?

    init(variation: FormItemConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }

    init(props: FormItemProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props else { return }

        self.disableAlpha = props.disableAlpha?.value
        self.hintIcon = ImageContextBuilder(props.hintIcon?.value).context
        self.hintColor = ButtonColorContextBuilder(statefulColor: props.hintColor, outputType: .statefulColor).context

        self.titleColor = ButtonColorContextBuilder(statefulColor: props.titleColor, outputType: .statefulColor).context
        self.optionalColor = ButtonColorContextBuilder(statefulColor: props.optionalColor, outputType: .statefulColor).context
        self.titleCaptionColor = ButtonColorContextBuilder(statefulColor: props.titleCaptionColor, outputType: .statefulColor).context
        self.captionColor = ButtonColorContextBuilder(statefulColor: props.captionColor, outputType: .statefulColor).context
        self.counterColor = ButtonColorContextBuilder(statefulColor: props.counterColor, outputType: .statefulColor).context

        self.titleTypography = TypographyTokenContextBuilder(string: props.titleStyle?.value, id: id, component: component).context
        self.optionalTypography = TypographyTokenContextBuilder(string: props.optionalStyle?.value, id: id, component: component).context
        self.titleCaptionTypography = TypographyTokenContextBuilder(string: props.titleCaptionStyle?.value, id: id, component: component).context
        self.captionTypography = TypographyTokenContextBuilder(string: props.captionStyle?.value, id: id, component: component).context
        self.counterTypography = TypographyTokenContextBuilder(string: props.counterStyle?.value, id: id, component: component).context

        self.titlePlacement = FormTitlePlacementContextBuilder(value: props.titlePlacement?.value).context
        self.formType = FormTypeContextBuilder(value: props.formItemType?.value).context
        self.topTextAlignment = FormTextAlignmentContextBuilder(value: props.topTextAlignment?.value).context
        self.bottomTextAlignment = FormTextAlignmentContextBuilder(value: props.bottomTextAlignment?.value).context
        self.indicatorAlignment = FormIndicatorAlignmentContextBuilder(value: props.indicatorAlignment?.value).context
        self.indicatorAlignmentMode = IndicatorAlignmentModeContextBuilder(value: props.indicatorAlignmentMode?.value).context

        if let indicatorStyle = props.indicatorStyle?.value {
            self.indicatorAppearance = ComponentStyleContextBuilder(indicatorStyle).context
        }
    }
}
