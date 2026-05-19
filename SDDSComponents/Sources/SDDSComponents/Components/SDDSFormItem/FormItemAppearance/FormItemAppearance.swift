import Foundation
import SwiftUI
import SDDSThemeCore

public struct FormItemAppearance {
    public var size: FormItemSizeConfiguration
    public var disableAlpha: CGFloat

    public var hintIcon: Image?
    public var hintColor: StatefulColor

    public var titleColor: StatefulColor
    public var titleTypography: TypographyConfiguration
    public var titlePlacement: FormTitlePlacement

    public var optionalColor: StatefulColor
    public var optionalTypography: TypographyConfiguration

    public var titleCaptionColor: StatefulColor
    public var titleCaptionTypography: TypographyConfiguration

    public var captionColor: StatefulColor
    public var captionTypography: TypographyConfiguration

    public var counterColor: StatefulColor
    public var counterTypography: TypographyConfiguration

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
}

extension FormItemAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: FormItemAppearance.self, fallback: FormItemAppearance())
    }
}
