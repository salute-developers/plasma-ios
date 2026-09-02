import Foundation

struct FormItemSize: CodeGenerationSize {
    typealias Props = FormItemProps

    var hintWidth: String?
    var hintHeight: String?
    var titleBlockWidth: String?
    var titleBlockPadding: String?
    var titleBlockSpacing: String?
    var titleCaptionPadding: String?
    var captionPadding: String?
    var counterPadding: String?
    var indicatorOffset: String?

    init(variation: FormItemConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }

    init(props: FormItemProps, id: String? = nil, nullify: Bool = false) {
        self.hintWidth = CGFloatContextBuilder(props.hintWidth?.value, nullify: nullify).context
        self.hintHeight = CGFloatContextBuilder(props.hintHeight?.value, nullify: nullify).context
        self.titleBlockWidth = CGFloatContextBuilder(props.titleBlockWidth?.value, nullify: nullify).context
        self.titleBlockPadding = CGFloatContextBuilder(props.titleBlockPadding?.value, nullify: nullify).context
        self.titleBlockSpacing = CGFloatContextBuilder(props.titleBlockSpacing?.value, nullify: nullify).context
        self.titleCaptionPadding = CGFloatContextBuilder(props.titleCaptionPadding?.value, nullify: nullify).context
        self.captionPadding = CGFloatContextBuilder(props.captionPadding?.value, nullify: nullify).context
        self.counterPadding = CGFloatContextBuilder(props.counterPadding?.value, nullify: nullify).context
        self.indicatorOffset = SizeContextBuilder(
            x: props.indicatorOffsetX?.value,
            y: props.indicatorOffsetY?.value,
            style: .point,
            nullify: nullify
        ).context
    }

    init() {
        self.hintWidth = CGFloat.defaultContext
        self.hintHeight = CGFloat.defaultContext
        self.titleBlockWidth = CGFloat.defaultContext
        self.titleBlockPadding = CGFloat.defaultContext
        self.titleBlockSpacing = CGFloat.defaultContext
        self.titleCaptionPadding = CGFloat.defaultContext
        self.captionPadding = CGFloat.defaultContext
        self.counterPadding = CGFloat.defaultContext
        self.indicatorOffset = CGPoint.defaultContext
    }
}

final class FormTitlePlacementContextBuilder: CodeGenerationContextBuilder {
    private let value: String?

    init(value: String?) {
        self.value = value
    }

    var context: String? {
        switch value?.lowercased() {
        case "title-start":
            return "FormTitlePlacement.start"
        case "title-top":
            return "FormTitlePlacement.top"
        default:
            return "FormTitlePlacement.none"
        }
    }
}

final class FormTextAlignmentContextBuilder: CodeGenerationContextBuilder {
    private let value: String?

    init(value: String?) {
        self.value = value
    }

    var context: String? {
        switch value?.lowercased() {
        case "center":
            return "FormTextAlignment.center"
        case "edge":
            return "FormTextAlignment.edge"
        default:
            return nil
        }
    }
}

final class FormTypeContextBuilder: CodeGenerationContextBuilder {
    private let value: String?

    init(value: String?) {
        self.value = value
    }

    var context: String? {
        switch value?.lowercased() {
        case "required":
            return "FormType.required"
        case "optional":
            return "FormType.optional"
        default:
            return nil
        }
    }
}

final class IndicatorAlignmentModeContextBuilder: CodeGenerationContextBuilder {
    private let value: String?

    init(value: String?) {
        self.value = value
    }

    var context: String? {
        switch value?.lowercased() {
        case "inner":
            return "FormIndicatorAlignmentMode.inner"
        case "outer":
            return "FormIndicatorAlignmentMode.outer"
        default:
            return nil
        }
    }
}

final class FormIndicatorAlignmentContextBuilder: CodeGenerationContextBuilder {
    private let value: String?

    init(value: String?) {
        self.value = value
    }

    var context: String? {
        switch value?.lowercased() {
        case "top-start":
            return "FormIndicatorAlignment.topStart"
        case "top-center":
            return "FormIndicatorAlignment.topCenter"
        case "top-end":
            return "FormIndicatorAlignment.topEnd"
        case "center-start":
            return "FormIndicatorAlignment.centerStart"
        case "center":
            return "FormIndicatorAlignment.center"
        case "center-end":
            return "FormIndicatorAlignment.centerEnd"
        case "bottom-start":
            return "FormIndicatorAlignment.bottomStart"
        case "bottom-center":
            return "FormIndicatorAlignment.bottomCenter"
        case "bottom-end":
            return "FormIndicatorAlignment.bottomEnd"
        default:
            return nil
        }
    }
}
