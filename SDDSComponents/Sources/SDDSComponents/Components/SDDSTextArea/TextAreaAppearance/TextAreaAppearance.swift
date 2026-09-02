import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSApiInfo

@ApiInfo(components: ["TextAreaClear"])
public struct TextAreaAppearance {
    public var id = UUID()
    public var size: TextAreaSizeConfiguration
    @ApiName("chipStyle")
    public var chipAppearance: ChipAppearance
    @ApiName("chipGroupStyle")
    public var chipGroupAppearance: ChipGroupAppearance
    public var labelPlacement: TextAreaLabelPlacement
    @ApiFromVariation
    public var requiredPlacement: TextAreaRequiredPlacement
    public var backgroundColor: StatefulFillStyle
    public var backgroundColorReadOnly: ColorToken?
    @ApiIgnore
    public var borderColor: ColorToken
    public var captionColor: StatefulFillStyle
    public var captionColorReadOnly: ColorToken?
    @ApiName("captionStyle")
    public var captionTypography: TypographyConfiguration
    public var counterColor: ColorToken
    @ApiIgnore
    public var counterColorReadOnly: ColorToken
    @ApiName("counterStyle")
    public var counterTypography: TypographyConfiguration
    public var cursorColor: ColorToken
    @ApiName("disableAlpha")
    @ApiRawNumber
    public var disabledAlpha: CGFloat
    public var endContentColor: StatefulFillStyle
    public var endContentColorReadOnly: ColorToken?
    @ApiIgnore
    @ApiIgnore
    public var innerTitleTextAlignment: TextAlignment
    @ApiName("labelStyle")
    public var innerTitleTypography: TypographyConfiguration
    @ApiIgnore
    public var inputTextAlignment: TextAlignment
    @ApiName("dividerColor")
    public var lineColor: StatefulFillStyle
    @ApiName("dividerColorReadOnly")
    public var lineColorReadOnly: ColorToken
    @ApiName("optionalColor")
    public var optionalTitleColor: ColorToken
    public var placeholderColor: StatefulFillStyle
    public var placeholderColorReadOnly: ColorToken?
    @ApiName("indicatorColor")
    public var requiredIndicatorColor: ColorToken
    public var startContentColor: ColorToken
    @ApiIgnore
    public var startContentColorReadOnly: ColorToken
    @ApiName("valueColor")
    public var textColor: StatefulFillStyle
    @ApiName("valueColorReadOnly")
    public var textColorReadOnly: ColorToken?
    @ApiName("valueStyle")
    public var textTypography: TypographyConfiguration
    @ApiName("labelColor")
    public var titleColor: ColorToken
    @ApiIgnore
    public var titleTextAlignment: TextAlignment
    @ApiName("labelStyle")
    public var titleTypography: TypographyConfiguration
    public var scrollBarTrackColor: ColorToken
    public var scrollBarThumbColor: ColorToken

    public init(
        size: TextAreaSizeConfiguration = ZeroTextAreaSize(),
        chipAppearance: ChipAppearance = ChipAppearance(),
        chipGroupAppearance: ChipGroupAppearance = ChipGroupAppearance(),
        labelPlacement: TextAreaLabelPlacement = .none,
        requiredPlacement: TextAreaRequiredPlacement = .none,
        backgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        backgroundColorReadOnly: ColorToken? = nil,
        borderColor: ColorToken = .clearColor,
        captionColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        captionColorReadOnly: ColorToken? = nil,
        counterColor: ColorToken = .clearColor,
        counterColorReadOnly: ColorToken = .clearColor,
        cursorColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0,
        endContentColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        endContentColorReadOnly: ColorToken? = nil,
        innerTitleTextAlignment: TextAlignment = .leading,
        inputTextAlignment: TextAlignment = .leading,
        lineColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        lineColorReadonly: ColorToken = .clearColor,
        optionalTitleColor: ColorToken = .clearColor,
        placeholderColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        placeholderColorReadOnly: ColorToken? = nil,
        requiredIndicatorColor: ColorToken = .clearColor,
        scrollBarTrackColor: ColorToken = .clearColor,
        scrollBarThumbColor: ColorToken = .clearColor,
        startContentColor: ColorToken = .clearColor,
        startContentColorReadOnly: ColorToken = .clearColor,
        textColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        textColorReadOnly: ColorToken? = nil,
        titleColor: ColorToken = .clearColor,
        titleTextAlignment: TextAlignment = .leading,
        captionTypography: TypographyConfiguration = .default,
        counterTypography: TypographyConfiguration = .default,
        innerTitleTypography: TypographyConfiguration = .default,
        textTypography: TypographyConfiguration = .default,
        titleTypography: TypographyConfiguration = .default
    ) {
        self.size = size
        self.chipAppearance = chipAppearance
        self.chipGroupAppearance = chipGroupAppearance
        self.labelPlacement = labelPlacement
        self.requiredPlacement = requiredPlacement
        self.backgroundColor = backgroundColor
        self.backgroundColorReadOnly = backgroundColorReadOnly
        self.borderColor = borderColor
        self.captionColor = captionColor
        self.captionColorReadOnly = captionColorReadOnly
        self.captionTypography = captionTypography
        self.counterColor = counterColor
        self.counterColorReadOnly = counterColorReadOnly
        self.counterTypography = counterTypography
        self.cursorColor = cursorColor
        self.disabledAlpha = disabledAlpha
        self.endContentColor = endContentColor
        self.endContentColorReadOnly = endContentColorReadOnly
        self.innerTitleTextAlignment = innerTitleTextAlignment
        self.innerTitleTypography = innerTitleTypography
        self.inputTextAlignment = inputTextAlignment
        self.lineColor = lineColor
        self.lineColorReadOnly = lineColorReadonly
        self.optionalTitleColor = optionalTitleColor
        self.placeholderColor = placeholderColor
        self.placeholderColorReadOnly = placeholderColorReadOnly
        self.requiredIndicatorColor = requiredIndicatorColor
        self.startContentColor = startContentColor
        self.startContentColorReadOnly = startContentColorReadOnly
        self.scrollBarThumbColor = scrollBarThumbColor
        self.scrollBarTrackColor = scrollBarTrackColor
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
        size: TextAreaSizeConfiguration = ZeroTextAreaSize(),
        chipAppearance: ChipAppearance = ChipAppearance(),
        chipGroupAppearance: ChipGroupAppearance = ChipGroupAppearance(),
        labelPlacement: TextAreaLabelPlacement = .none,
        requiredPlacement: TextAreaRequiredPlacement = .none,
        backgroundColor: ColorToken = .clearColor,
        backgroundColorFocused: ColorToken = .clearColor,
        backgroundColorReadOnly: ColorToken? = nil,
        borderColor: ColorToken = .clearColor,
        captionColor: ColorToken = .clearColor,
        captionColorFocused: ColorToken = .clearColor,
        captionColorReadOnly: ColorToken? = nil,
        counterColor: ColorToken = .clearColor,
        counterColorReadOnly: ColorToken = .clearColor,
        cursorColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0,
        endContentColor: ColorToken = .clearColor,
        endContentColorReadOnly: ColorToken? = nil,
        endContentColorFocused: ColorToken = .clearColor,
        innerTitleTextAlignment: TextAlignment = .leading,
        inputTextAlignment: TextAlignment = .leading,
        lineColor: ColorToken = .clearColor,
        lineColorFocused: ColorToken = .clearColor,
        lineColorReadonly: ColorToken = .clearColor,
        optionalTitleColor: ColorToken = .clearColor,
        placeholderColor: ColorToken = .clearColor,
        placeholderColorFocused: ColorToken = .clearColor,
        placeholderColorReadOnly: ColorToken? = nil,
        requiredIndicatorColor: ColorToken = .clearColor,
        scrollBarTrackColor: ColorToken = .clearColor,
        scrollBarThumbColor: ColorToken = .clearColor,
        startContentColor: ColorToken = .clearColor,
        startContentColorReadOnly: ColorToken = .clearColor,
        textColor: ColorToken = .clearColor,
        textColorFocused: ColorToken = .clearColor,
        textColorReadOnly: ColorToken? = nil,
        titleColor: ColorToken = .clearColor,
        titleTextAlignment: TextAlignment = .leading,
        captionTypography: TypographyConfiguration = .default,
        counterTypography: TypographyConfiguration = .default,
        innerTitleTypography: TypographyConfiguration = .default,
        textTypography: TypographyConfiguration = .default,
        titleTypography: TypographyConfiguration = .default
    ) {
        self.init(
            size: size,
            chipAppearance: chipAppearance,
            chipGroupAppearance: chipGroupAppearance,
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
            counterColor: counterColor,
            counterColorReadOnly: counterColorReadOnly,
            cursorColor: cursorColor,
            disabledAlpha: disabledAlpha,
            endContentColor: StatefulFillStyle(
                defaultValue: .color(endContentColor),
                values: [.init(states: [InteractiveState.activated], value: .color(endContentColorFocused))]
            ),
            endContentColorReadOnly: endContentColorReadOnly,
            innerTitleTextAlignment: innerTitleTextAlignment,
            inputTextAlignment: inputTextAlignment,
            lineColor: StatefulFillStyle(
                defaultValue: .color(lineColor),
                values: [.init(states: [InteractiveState.activated], value: .color(lineColorFocused))]
            ),
            lineColorReadonly: lineColorReadonly,
            optionalTitleColor: optionalTitleColor,
            placeholderColor: StatefulFillStyle(
                defaultValue: .color(placeholderColor),
                values: [.init(states: [InteractiveState.activated], value: .color(placeholderColorFocused))]
            ),
            placeholderColorReadOnly: placeholderColorReadOnly,
            requiredIndicatorColor: requiredIndicatorColor,
            scrollBarTrackColor: scrollBarTrackColor,
            scrollBarThumbColor: scrollBarThumbColor,
            startContentColor: startContentColor,
            startContentColorReadOnly: startContentColorReadOnly,
            textColor: StatefulFillStyle(
                defaultValue: .color(textColor),
                values: [.init(states: [InteractiveState.activated], value: .color(textColorFocused))]
            ),
            textColorReadOnly: textColorReadOnly,
            titleColor: titleColor,
            titleTextAlignment: titleTextAlignment,
            captionTypography: captionTypography,
            counterTypography: counterTypography,
            innerTitleTypography: innerTitleTypography,
            textTypography: textTypography,
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
    @available(*, deprecated, message: "Use textColor.resolvedValue(for: [.activated]).")
    public var textColorFocused: ColorToken {
        textColor.resolvedValue(for: Set([InteractiveState.activated])).representativeColorToken
    }
}

extension TextAreaAppearance: Hashable {
    public static func == (lhs: TextAreaAppearance, rhs: TextAreaAppearance) -> Bool {
        return lhs.id == rhs.id &&
            lhs.labelPlacement == rhs.labelPlacement &&
            lhs.requiredPlacement == rhs.requiredPlacement &&
            lhs.backgroundColor == rhs.backgroundColor &&
            lhs.backgroundColorFocused == rhs.backgroundColorFocused &&
            lhs.backgroundColorReadOnly == rhs.backgroundColorReadOnly &&
            lhs.borderColor == rhs.borderColor &&
            lhs.captionColor == rhs.captionColor &&
            lhs.captionColorFocused == rhs.captionColorFocused &&
            lhs.captionColorReadOnly == rhs.captionColorReadOnly &&
            lhs.counterColor == rhs.counterColor &&
            lhs.counterColorReadOnly == rhs.counterColorReadOnly &&
            lhs.cursorColor == rhs.cursorColor &&
            lhs.disabledAlpha == rhs.disabledAlpha &&
            lhs.endContentColor == rhs.endContentColor &&
            lhs.endContentColorReadOnly == rhs.endContentColorReadOnly &&
            lhs.endContentColorFocused == rhs.endContentColorFocused &&
            lhs.innerTitleTextAlignment == rhs.innerTitleTextAlignment &&
            lhs.inputTextAlignment == rhs.inputTextAlignment &&
            lhs.lineColor == rhs.lineColor &&
            lhs.lineColorFocused == rhs.lineColorFocused &&
            lhs.lineColorReadOnly == rhs.lineColorReadOnly &&
            lhs.optionalTitleColor == rhs.optionalTitleColor &&
            lhs.placeholderColor == rhs.placeholderColor &&
            lhs.placeholderColorFocused == rhs.placeholderColorFocused &&
            lhs.placeholderColorReadOnly == rhs.placeholderColorReadOnly &&
            lhs.requiredIndicatorColor == rhs.requiredIndicatorColor &&
            lhs.startContentColor == rhs.startContentColor &&
            lhs.startContentColorReadOnly == rhs.startContentColorReadOnly &&
            lhs.scrollBarThumbColor == rhs.scrollBarThumbColor &&
            lhs.scrollBarTrackColor == rhs.scrollBarTrackColor &&
            lhs.textColor == rhs.textColor &&
            lhs.textColorFocused == rhs.textColorFocused &&
            lhs.textColorReadOnly == rhs.textColorReadOnly &&
            lhs.titleColor == rhs.titleColor &&
            lhs.titleTextAlignment == rhs.titleTextAlignment
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(labelPlacement)
        hasher.combine(requiredPlacement)
        hasher.combine(backgroundColor)
        hasher.combine(backgroundColorFocused)
        hasher.combine(backgroundColorReadOnly)
        hasher.combine(borderColor)
        hasher.combine(captionColor)
        hasher.combine(captionColorFocused)
        hasher.combine(captionColorReadOnly)
        hasher.combine(counterColor)
        hasher.combine(counterColorReadOnly)
        hasher.combine(cursorColor)
        hasher.combine(disabledAlpha)
        hasher.combine(endContentColor)
        hasher.combine(endContentColorReadOnly)
        hasher.combine(endContentColorFocused)
        hasher.combine(innerTitleTextAlignment)
        hasher.combine(inputTextAlignment)
        hasher.combine(lineColor)
        hasher.combine(lineColorFocused)
        hasher.combine(lineColorReadOnly)
        hasher.combine(optionalTitleColor)
        hasher.combine(placeholderColor)
        hasher.combine(placeholderColorFocused)
        hasher.combine(placeholderColorReadOnly)
        hasher.combine(requiredIndicatorColor)
        hasher.combine(startContentColor)
        hasher.combine(startContentColorReadOnly)
        hasher.combine(scrollBarThumbColor)
        hasher.combine(scrollBarTrackColor)
        hasher.combine(textColor)
        hasher.combine(textColorFocused)
        hasher.combine(textColorReadOnly)
        hasher.combine(titleColor)
        hasher.combine(titleTextAlignment)
    }
}

extension TextAreaAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: TextAreaAppearance.self, fallback: TextAreaAppearance())
    }
}
