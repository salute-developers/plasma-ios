import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSApiInfo

@ApiInfo(components: ["TextFieldClear"])
public struct TextFieldAppearance {
    let id = UUID()
    public var size: TextFieldSizeConfiguration
    @ApiName("chipGroupStyle")
    public var chipGroupAppearance: ChipGroupAppearance
    @ApiName("chipStyle")
    public var chipAppearance: ChipAppearance
    public var labelPlacement: TextFieldLabelPlacement
    @ApiName("requiredPlacement")
    @ApiFromVariation
    public var requiredPlacement: TextFieldRequiredPlacement
    public var backgroundColor: StatefulFillStyle
    public var backgroundColorReadOnly: ColorToken?
    public var borderColor: ColorToken
    public var captionColor: StatefulFillStyle
    public var captionColorReadOnly: ColorToken
    public var captionTextAlignment: TextAlignment
    public var captionTypography: TypographyConfiguration
    public var cursorColor: ColorToken
    @ApiName("disableAlpha")
    @ApiRawNumber
    public var disabledAlpha: CGFloat
    public var endContentColor: StatefulFillStyle
    public var endContentColorReadOnly: ColorToken?
    public var inputTextAlignment: TextAlignment
    public var innerTitleTextAlignment: TextAlignment
    @ApiName("labelStyle")
    public var innerTitleTypography: TypographyConfiguration
    @ApiName("dividerColor")
    public var lineColor: StatefulFillStyle
    @ApiName("dividerColorReadOnly")
    public var lineColorReadOnly: ColorToken
    @ApiName("optionalColor")
    public var optionalTitleColor: ColorToken
    @ApiName("placeholderColor")
    public var placeholderColor: StatefulFillStyle
    public var placeholderColorReadOnly: ColorToken?
    @ApiName("indicatorColor")
    public var requiredIndicatorColor: ColorToken
    public var startContentColor: StatefulFillStyle
    public var startContentColorReadOnly: ColorToken?
    @ApiCopy("optionalTitleColor")
    public var textAfterColor: ColorToken
    @ApiName("valueStyle")
    public var textAfterTypography: TypographyConfiguration
    @ApiCopy("optionalTitleColor")
    public var textBeforeColor: ColorToken
    @ApiName("valueStyle")
    public var textBeforeTypography: TypographyConfiguration
    @ApiName("valueColor")
    public var textColor: StatefulFillStyle
    @ApiName("valueColorReadOnly")
    public var textColorReadOnly: ColorToken?
    @ApiName("valueStyle")
    public var textTypography: TypographyConfiguration
    @ApiName("labelColor")
    public var titleColor: ColorToken
    public var titleTextAlignment: TextAlignment
    @ApiName("labelStyle")
    public var titleTypography: TypographyConfiguration
    
    public init(
        size: TextFieldSizeConfiguration = ZeroTextFieldSize(),
        chipGroupAppearance: ChipGroupAppearance = ChipGroupAppearance(),
        chipAppearance: ChipAppearance = ChipAppearance(),
        labelPlacement: TextFieldLabelPlacement = .none,
        requiredPlacement: TextFieldRequiredPlacement = .none,
        backgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        backgroundColorReadOnly: ColorToken? = nil,
        borderColor: ColorToken = .clearColor,
        captionColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        captionColorReadOnly: ColorToken = .clearColor,
        captionTextAlignment: TextAlignment = .leading,
        cursorColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0,
        endContentColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        endContentColorReadOnly: ColorToken = .clearColor,
        inputTextAlignment: TextAlignment = .leading,
        innerTitleTextAlignment: TextAlignment = .leading,
        lineColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        lineColorReadOnly: ColorToken = .clearColor,
        optionalTitleColor: ColorToken = .clearColor,
        placeholderColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        placeholderColorReadOnly: ColorToken? = nil,
        requiredIndicatorColor: ColorToken = .clearColor,
        startContentColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        startContentColorReadOnly: ColorToken? = nil,
        textAfterColor: ColorToken = .clearColor,
        textBeforeColor: ColorToken = .clearColor,
        textColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        textColorReadOnly: ColorToken? = nil,
        titleColor: ColorToken = .clearColor,
        titleTextAlignment: TextAlignment = .leading,
        captionTypography: TypographyConfiguration = .default,
        innerTitleTypography: TypographyConfiguration = .default,
        textTypography: TypographyConfiguration = .default,
        textAfterTypography: TypographyConfiguration = .default,
        textBeforeTypography: TypographyConfiguration = .default,
        titleTypography: TypographyConfiguration = .default
    ) {
        self.size = size
        self.chipGroupAppearance = chipGroupAppearance
        self.chipAppearance = chipAppearance
        self.labelPlacement = labelPlacement
        self.requiredPlacement = requiredPlacement
        self.backgroundColor = backgroundColor
        self.backgroundColorReadOnly = backgroundColorReadOnly
        self.borderColor = borderColor
        self.captionColor = captionColor
        self.captionColorReadOnly = captionColorReadOnly
        self.captionTextAlignment = captionTextAlignment
        self.captionTypography = captionTypography
        self.cursorColor = cursorColor
        self.disabledAlpha = disabledAlpha
        self.endContentColor = endContentColor
        self.endContentColorReadOnly = endContentColorReadOnly
        self.inputTextAlignment = inputTextAlignment
        self.innerTitleTextAlignment = innerTitleTextAlignment
        self.innerTitleTypography = innerTitleTypography
        self.lineColor = lineColor
        self.lineColorReadOnly = lineColorReadOnly
        self.optionalTitleColor = optionalTitleColor
        self.placeholderColor = placeholderColor
        self.placeholderColorReadOnly = placeholderColorReadOnly
        self.requiredIndicatorColor = requiredIndicatorColor
        self.startContentColor = startContentColor
        self.startContentColorReadOnly = startContentColorReadOnly
        self.textAfterColor = textAfterColor
        self.textAfterTypography = textAfterTypography
        self.textBeforeColor = textBeforeColor
        self.textBeforeTypography = textBeforeTypography
        self.textColor = textColor
        self.textColorReadOnly = textColorReadOnly
        self.textTypography = textTypography
        self.titleColor = titleColor
        self.titleTextAlignment = titleTextAlignment
        self.titleTypography = titleTypography
    }

    @available(*, deprecated, message: "ColorToken is deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
    public init(
        size: TextFieldSizeConfiguration = ZeroTextFieldSize(),
        chipGroupAppearance: ChipGroupAppearance = ChipGroupAppearance(),
        chipAppearance: ChipAppearance = ChipAppearance(),
        labelPlacement: TextFieldLabelPlacement = .none,
        requiredPlacement: TextFieldRequiredPlacement = .none,
        backgroundColor: ColorToken = .clearColor,
        backgroundColorFocused: ColorToken = .clearColor,
        backgroundColorReadOnly: ColorToken? = nil,
        borderColor: ColorToken = .clearColor,
        captionColor: ColorToken = .clearColor,
        captionColorFocused: ColorToken = .clearColor,
        captionColorReadOnly: ColorToken = .clearColor,
        captionTextAlignment: TextAlignment = .leading,
        cursorColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0,
        endContentColor: ColorToken = .clearColor,
        endContentColorReadOnly: ColorToken = .clearColor,
        endContentColorFocused: ColorToken = .clearColor,
        inputTextAlignment: TextAlignment = .leading,
        innerTitleTextAlignment: TextAlignment = .leading,
        lineColor: ColorToken = .clearColor,
        lineColorFocused: ColorToken = .clearColor,
        lineColorReadOnly: ColorToken = .clearColor,
        optionalTitleColor: ColorToken = .clearColor,
        placeholderColor: ColorToken = .clearColor,
        placeholderColorFocused: ColorToken = .clearColor,
        placeholderColorReadOnly: ColorToken? = nil,
        requiredIndicatorColor: ColorToken = .clearColor,
        startContentColor: ColorToken = .clearColor,
        startContentColorFocused: ColorToken = .clearColor,
        startContentColorReadOnly: ColorToken? = nil,
        textAfterColor: ColorToken = .clearColor,
        textBeforeColor: ColorToken = .clearColor,
        textColor: ColorToken = .clearColor,
        textColorFocused: ColorToken = .clearColor,
        textColorReadOnly: ColorToken? = nil,
        titleColor: ColorToken = .clearColor,
        titleTextAlignment: TextAlignment = .leading,
        captionTypography: TypographyConfiguration = .default,
        innerTitleTypography: TypographyConfiguration = .default,
        textTypography: TypographyConfiguration = .default,
        textAfterTypography: TypographyConfiguration = .default,
        textBeforeTypography: TypographyConfiguration = .default,
        titleTypography: TypographyConfiguration = .default
    ) {
        self.init(
            size: size,
            chipGroupAppearance: chipGroupAppearance,
            chipAppearance: chipAppearance,
            labelPlacement: labelPlacement,
            requiredPlacement: requiredPlacement,
            backgroundColor: StatefulFillStyle(
                defaultValue: .color(backgroundColor),
                values: [.init(states: [InteractiveState.activated], value: .color(backgroundColorFocused))]
            ),
            backgroundColorReadOnly: backgroundColorReadOnly,
            borderColor: borderColor,
            captionColor: StatefulFillStyle(
                defaultValue: .color(captionColor),
                values: [.init(states: [InteractiveState.activated], value: .color(captionColorFocused))]
            ),
            captionColorReadOnly: captionColorReadOnly,
            captionTextAlignment: captionTextAlignment,
            cursorColor: cursorColor,
            disabledAlpha: disabledAlpha,
            endContentColor: StatefulFillStyle(
                defaultValue: .color(endContentColor),
                values: [.init(states: [InteractiveState.activated], value: .color(endContentColorFocused))]
            ),
            endContentColorReadOnly: endContentColorReadOnly,
            inputTextAlignment: inputTextAlignment,
            innerTitleTextAlignment: innerTitleTextAlignment,
            lineColor: StatefulFillStyle(
                defaultValue: .color(lineColor),
                values: [.init(states: [InteractiveState.activated], value: .color(lineColorFocused))]
            ),
            lineColorReadOnly: lineColorReadOnly,
            optionalTitleColor: optionalTitleColor,
            placeholderColor: StatefulFillStyle(
                defaultValue: .color(placeholderColor),
                values: [.init(states: [InteractiveState.activated], value: .color(placeholderColorFocused))]
            ),
            placeholderColorReadOnly: placeholderColorReadOnly,
            requiredIndicatorColor: requiredIndicatorColor,
            startContentColor: StatefulFillStyle(
                defaultValue: .color(startContentColor),
                values: [.init(states: [InteractiveState.activated], value: .color(startContentColorFocused))]
            ),
            startContentColorReadOnly: startContentColorReadOnly,
            textAfterColor: textAfterColor,
            textBeforeColor: textBeforeColor,
            textColor: StatefulFillStyle(
                defaultValue: .color(textColor),
                values: [.init(states: [InteractiveState.activated], value: .color(textColorFocused))]
            ),
            textColorReadOnly: textColorReadOnly,
            titleColor: titleColor,
            titleTextAlignment: titleTextAlignment,
            captionTypography: captionTypography,
            innerTitleTypography: innerTitleTypography,
            textTypography: textTypography,
            textAfterTypography: textAfterTypography,
            textBeforeTypography: textBeforeTypography,
            titleTypography: titleTypography
        )
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use backgroundColor.resolvedValue(for: [.activated]).")
    public var backgroundColorFocused: ColorToken {
        backgroundColor.resolvedValue(for: Set([InteractiveState.activated])).representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use captionColor.resolvedValue(for: [.activated]).")
    public var captionColorFocused: ColorToken {
        captionColor.resolvedValue(for: Set([InteractiveState.activated])).representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use endContentColor.resolvedValue(for: [.activated]).")
    public var endContentColorFocused: ColorToken {
        endContentColor.resolvedValue(for: Set([InteractiveState.activated])).representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use lineColor.resolvedValue(for: [.activated]).")
    public var lineColorFocused: ColorToken {
        lineColor.resolvedValue(for: Set([InteractiveState.activated])).representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use placeholderColor.resolvedValue(for: [.activated]).")
    public var placeholderColorFocused: ColorToken {
        placeholderColor.resolvedValue(for: Set([InteractiveState.activated])).representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use startContentColor.resolvedValue(for: [.activated]).")
    public var startContentColorFocused: ColorToken {
        startContentColor.resolvedValue(for: Set([InteractiveState.activated])).representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use textColor.resolvedValue(for: [.activated]).")
    public var textColorFocused: ColorToken {
        textColor.resolvedValue(for: Set([InteractiveState.activated])).representativeColorToken
    }
}

extension TextFieldAppearance {
    public static func == (lhs: TextFieldAppearance, rhs: TextFieldAppearance) -> Bool {
        return lhs.id == rhs.id &&
            lhs.chipAppearance == rhs.chipAppearance &&
            lhs.labelPlacement == rhs.labelPlacement &&
            lhs.requiredPlacement == rhs.requiredPlacement &&
            lhs.backgroundColor == rhs.backgroundColor &&
            lhs.backgroundColorFocused == rhs.backgroundColorFocused &&
            lhs.backgroundColorReadOnly == rhs.backgroundColorReadOnly &&
            lhs.borderColor == rhs.borderColor &&
            lhs.captionColor == rhs.captionColor &&
            lhs.captionColorFocused == rhs.captionColorFocused &&
            lhs.captionColorReadOnly == rhs.captionColorReadOnly &&
            lhs.captionTextAlignment == rhs.captionTextAlignment &&
            lhs.cursorColor == rhs.cursorColor &&
            lhs.disabledAlpha == rhs.disabledAlpha &&
            lhs.endContentColor == rhs.endContentColor &&
            lhs.endContentColorReadOnly == rhs.endContentColorReadOnly &&
            lhs.endContentColorFocused == rhs.endContentColorFocused &&
            lhs.inputTextAlignment == rhs.inputTextAlignment &&
            lhs.innerTitleTextAlignment == rhs.innerTitleTextAlignment &&
            lhs.lineColor == rhs.lineColor &&
            lhs.lineColorFocused == rhs.lineColorFocused &&
            lhs.lineColorReadOnly == rhs.lineColorReadOnly &&
            lhs.optionalTitleColor == rhs.optionalTitleColor &&
            lhs.placeholderColor == rhs.placeholderColor &&
            lhs.placeholderColorFocused == rhs.placeholderColorFocused &&
            lhs.placeholderColorReadOnly == rhs.placeholderColorReadOnly &&
            lhs.requiredIndicatorColor == rhs.requiredIndicatorColor &&
            lhs.startContentColor == rhs.startContentColor &&
            lhs.startContentColorFocused == rhs.startContentColorFocused &&
            lhs.startContentColorReadOnly == rhs.startContentColorReadOnly &&
            lhs.textAfterColor == rhs.textAfterColor &&
            lhs.textBeforeColor == rhs.textBeforeColor &&
            lhs.textColor == rhs.textColor &&
            lhs.textColorFocused == rhs.textColorFocused &&
            lhs.textColorReadOnly == rhs.textColorReadOnly &&
            lhs.titleColor == rhs.titleColor &&
            lhs.titleTextAlignment == rhs.titleTextAlignment
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(chipAppearance)
        hasher.combine(labelPlacement)
        hasher.combine(requiredPlacement)
        hasher.combine(backgroundColor)
        hasher.combine(backgroundColorFocused)
        hasher.combine(backgroundColorReadOnly)
        hasher.combine(borderColor)
        hasher.combine(captionColor)
        hasher.combine(captionColorFocused)
        hasher.combine(captionColorReadOnly)
        hasher.combine(captionTextAlignment)
        hasher.combine(cursorColor)
        hasher.combine(disabledAlpha)
        hasher.combine(endContentColor)
        hasher.combine(endContentColorReadOnly)
        hasher.combine(endContentColorFocused)
        hasher.combine(inputTextAlignment)
        hasher.combine(innerTitleTextAlignment)
        hasher.combine(lineColor)
        hasher.combine(lineColorFocused)
        hasher.combine(lineColorReadOnly)
        hasher.combine(optionalTitleColor)
        hasher.combine(placeholderColor)
        hasher.combine(placeholderColorFocused)
        hasher.combine(placeholderColorReadOnly)
        hasher.combine(requiredIndicatorColor)
        hasher.combine(startContentColor)
        hasher.combine(startContentColorFocused)
        hasher.combine(startContentColorReadOnly)
        hasher.combine(textAfterColor)
        hasher.combine(textBeforeColor)
        hasher.combine(textColor)
        hasher.combine(textColorFocused)
        hasher.combine(textColorReadOnly)
        hasher.combine(titleColor)
        hasher.combine(titleTextAlignment)
    }
}

extension TextFieldAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: TextFieldAppearance.self, fallback: TextFieldAppearance())
    }
}
