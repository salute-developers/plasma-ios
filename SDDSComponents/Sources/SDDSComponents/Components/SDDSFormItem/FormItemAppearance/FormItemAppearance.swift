import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSApiInfo

@ApiInfo
public struct FormItemAppearance {
    public var size: FormItemSizeConfiguration
    @ApiRawNumber
    public var disableAlpha: CGFloat

    public var hintIcon: Image?
    public var hintColor: StatefulFillStyle

    public var titleColor: StatefulFillStyle
    public var titleTypography: TypographyConfiguration
    public var titlePlacement: FormTitlePlacement

    public var optionalColor: StatefulFillStyle
    public var optionalTypography: TypographyConfiguration

    public var titleCaptionColor: StatefulFillStyle
    public var titleCaptionTypography: TypographyConfiguration

    public var captionColor: StatefulFillStyle
    public var captionTypography: TypographyConfiguration

    public var counterColor: StatefulFillStyle
    public var counterTypography: TypographyConfiguration

    @ApiName("formItemType")
    public var formType: FormType
    public var topTextAlignment: FormTextAlignment
    public var bottomTextAlignment: FormTextAlignment
    public var indicatorAlignment: FormIndicatorAlignment
    public var indicatorAlignmentMode: FormIndicatorAlignmentMode
    public var indicatorAppearance: IndicatorAppearance

    public init(
        size: FormItemSizeConfiguration = ZeroFormItemSize(),
        disableAlpha: CGFloat = 0.4,
        hintIcon: Image? = nil,
        hintColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        titleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        titleTypography: TypographyConfiguration = .default,
        titlePlacement: FormTitlePlacement = .none,
        optionalColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        optionalTypography: TypographyConfiguration = .default,
        titleCaptionColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        titleCaptionTypography: TypographyConfiguration = .default,
        captionColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        captionTypography: TypographyConfiguration = .default,
        counterColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        counterTypography: TypographyConfiguration = .default,
        formType: FormType = .optional,
        topTextAlignment: FormTextAlignment = .edge,
        bottomTextAlignment: FormTextAlignment = .edge,
        indicatorAlignment: FormIndicatorAlignment = .topStart,
        indicatorAlignmentMode: FormIndicatorAlignmentMode = .inner,
        indicatorAppearance: IndicatorAppearance = .defaultValue
    ) {
        self.size = size
        self.disableAlpha = disableAlpha
        self.hintIcon = hintIcon
        self.hintColor = hintColor
        self.titleColor = titleColor
        self.titleTypography = titleTypography
        self.titlePlacement = titlePlacement
        self.optionalColor = optionalColor
        self.optionalTypography = optionalTypography
        self.titleCaptionColor = titleCaptionColor
        self.titleCaptionTypography = titleCaptionTypography
        self.captionColor = captionColor
        self.captionTypography = captionTypography
        self.counterColor = counterColor
        self.counterTypography = counterTypography
        self.formType = formType
        self.topTextAlignment = topTextAlignment
        self.bottomTextAlignment = bottomTextAlignment
        self.indicatorAlignment = indicatorAlignment
        self.indicatorAlignmentMode = indicatorAlignmentMode
        self.indicatorAppearance = indicatorAppearance
    }

    @available(*, deprecated, message: "StatefulColor is deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
    public init(
        size: FormItemSizeConfiguration = ZeroFormItemSize(),
        disableAlpha: CGFloat = 0.4,
        hintIcon: Image? = nil,
        hintColor: StatefulColor = StatefulColor(defaultValue: .clearColor),
        titleColor: StatefulColor = StatefulColor(defaultValue: .clearColor),
        titleTypography: TypographyConfiguration = .default,
        titlePlacement: FormTitlePlacement = .none,
        optionalColor: StatefulColor = StatefulColor(defaultValue: .clearColor),
        optionalTypography: TypographyConfiguration = .default,
        titleCaptionColor: StatefulColor = StatefulColor(defaultValue: .clearColor),
        titleCaptionTypography: TypographyConfiguration = .default,
        captionColor: StatefulColor = StatefulColor(defaultValue: .clearColor),
        captionTypography: TypographyConfiguration = .default,
        counterColor: StatefulColor = StatefulColor(defaultValue: .clearColor),
        counterTypography: TypographyConfiguration = .default,
        formType: FormType = .optional,
        topTextAlignment: FormTextAlignment = .edge,
        bottomTextAlignment: FormTextAlignment = .edge,
        indicatorAlignment: FormIndicatorAlignment = .topStart,
        indicatorAlignmentMode: FormIndicatorAlignmentMode = .inner,
        indicatorAppearance: IndicatorAppearance = .defaultValue
    ) {
        self.init(
            size: size,
            disableAlpha: disableAlpha,
            hintIcon: hintIcon,
            hintColor: hintColor.statefulFillStyle,
            titleColor: titleColor.statefulFillStyle,
            titleTypography: titleTypography,
            titlePlacement: titlePlacement,
            optionalColor: optionalColor.statefulFillStyle,
            optionalTypography: optionalTypography,
            titleCaptionColor: titleCaptionColor.statefulFillStyle,
            titleCaptionTypography: titleCaptionTypography,
            captionColor: captionColor.statefulFillStyle,
            captionTypography: captionTypography,
            counterColor: counterColor.statefulFillStyle,
            counterTypography: counterTypography,
            formType: formType,
            topTextAlignment: topTextAlignment,
            bottomTextAlignment: bottomTextAlignment,
            indicatorAlignment: indicatorAlignment,
            indicatorAlignmentMode: indicatorAlignmentMode,
            indicatorAppearance: indicatorAppearance
        )
    }
}

extension FormItemAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: FormItemAppearance.self, fallback: FormItemAppearance())
    }
}
