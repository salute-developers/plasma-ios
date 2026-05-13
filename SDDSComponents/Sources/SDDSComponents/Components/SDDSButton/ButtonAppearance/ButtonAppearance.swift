import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `ButtonAppearance` определяет стили кнопки, включая типографику, цвета, размеры и другие параметры.

 - Properties:
    - size: Конфигурация размеров кнопки, определяемая `ButtonSizeConfiguration`.
    - shapeStyle: Стиль формы кнопки (например, закругленная или овальная), определяемый `ButtonShapeStyle`.
    - titleTypography: Типографика для текста заголовка кнопки, определяемая `TypographyConfiguration`.
    - titleColor: Стиль заливки текста заголовка кнопки для различных состояний, определяемый `StatefulFillStyle`.
    - subtitleTypography: Типографика для текста подзаголовка кнопки, определяемая `TypographyConfiguration`.
    - subtitleColor: Стиль заливки текста подзаголовка кнопки для различных состояний, определяемый `StatefulFillStyle`.
    - iconColor: Стиль заливки иконки кнопки для различных состояний, определяемый `StatefulFillStyle`.
    - spinnerColor: Стиль заливки спиннера загрузки для различных состояний, определяемый `StatefulFillStyle`.
    - backgroundColor: Стиль заливки фона кнопки для различных состояний, определяемый `StatefulFillStyle`.
    - disabledAlpha: Прозрачность кнопки, когда она отключена.
    - loadingAlpha: Прозрачность кнопки, когда она находится в состоянии загрузки.

 - Methods:
    - init: Инициализирует стили кнопки с заданными параметрами.
 */
public struct ButtonAppearance {
    /**
     Конфигурация размеров кнопки, определяемая `ButtonSizeConfiguration`.
     */
    public var size: ButtonSizeConfiguration

    /**
     Стиль формы кнопки (например, закругленная или овальная), определяемый `ComponentShapeStyle`.
     */
    public var shapeStyle: ComponentShapeStyle

    /**
     Типографика для текста заголовка кнопки, определяемая `TypographyConfiguration`.
     */
    public var titleTypography: TypographyConfiguration

    /**
     Стиль заливки текста заголовка кнопки для различных состояний, определяемый `StatefulFillStyle`.
     */
    public var titleColor: StatefulFillStyle

    /**
     Типографика для текста подзаголовка кнопки, определяемая `TypographyConfiguration`.
     */
    public var subtitleTypography: TypographyConfiguration

    /**
     Стиль заливки текста подзаголовка кнопки для различных состояний, определяемый `StatefulFillStyle`.
     */
    public var subtitleColor: StatefulFillStyle

    /**
     Стиль заливки иконки кнопки для различных состояний, определяемый `StatefulFillStyle`.
     */
    public var iconColor: StatefulFillStyle

    /**
     Стиль заливки спиннера загрузки для различных состояний, определяемый `StatefulFillStyle`.
     */
    public var spinnerColor: StatefulFillStyle

    /**
     Стиль заливки фона кнопки для различных состояний, определяемый `StatefulFillStyle`.
     */
    public var backgroundColor: StatefulFillStyle

    /**
     Прозрачность кнопки, когда она отключена.
     */
    public var disabledAlpha: CGFloat

    /**
     Прозрачность кнопки, когда она находится в состоянии загрузки.
     */
    public var loadingAlpha: CGFloat

    /**
     Инициализатор для создания стилистической конфигурации кнопки.

     - Parameters:
        - size: Конфигурация размеров кнопки.
        - shapeStyle: Стиль формы кнопки.
        - titleTypography: Типографика текста заголовка.
        - titleColor: Цвет текста заголовка для различных состояний.
        - subtitleTypography: Типографика текста подзаголовка.
        - subtitleColor: Цвет текста подзаголовка для различных состояний.
        - iconColor: Цвет иконки для различных состояний.
        - spinnerColor: Цвет спиннера загрузки для различных состояний.
        - backgroundColor: Цвет фона кнопки для различных состояний.
        - disabledAlpha: Прозрачность кнопки в отключенном состоянии.
        - loadingAlpha: Прозрачность кнопки в состоянии загрузки.
     */
    public init(
        size: ButtonSizeConfiguration = DefaultButtonSize(),
        shapeStyle: ComponentShapeStyle = .cornered,
        titleTypography: TypographyConfiguration = .default,
        titleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        subtitleTypography: TypographyConfiguration = .default,
        subtitleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        iconColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        spinnerColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        backgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        disabledAlpha: CGFloat = 0,
        loadingAlpha: CGFloat = 0
    ) {
        self.size = size
        self.shapeStyle = shapeStyle
        self.titleTypography = titleTypography
        self.titleColor = titleColor
        self.subtitleTypography = subtitleTypography
        self.subtitleColor = subtitleColor
        self.iconColor = iconColor
        self.spinnerColor = spinnerColor
        self.backgroundColor = backgroundColor
        self.disabledAlpha = disabledAlpha
        self.loadingAlpha = loadingAlpha
    }

    @available(*, deprecated, message: "Use init with StatefulFillStyle parameters.")
    public init(
        size: ButtonSizeConfiguration = DefaultButtonSize(),
        shapeStyle: ComponentShapeStyle = .cornered,
        titleTypography: TypographyConfiguration = .default,
        titleColor: ButtonColor,
        subtitleTypography: TypographyConfiguration = .default,
        subtitleColor: ButtonColor,
        iconColor: ButtonColor,
        spinnerColor: ButtonColor,
        backgroundColor: ButtonColor,
        disabledAlpha: CGFloat = 0,
        loadingAlpha: CGFloat = 0
    ) {
        self.init(
            size: size,
            shapeStyle: shapeStyle,
            titleTypography: titleTypography,
            titleColor: titleColor.statefulColor.statefulFillStyle,
            subtitleTypography: subtitleTypography,
            subtitleColor: subtitleColor.statefulColor.statefulFillStyle,
            iconColor: iconColor.statefulColor.statefulFillStyle,
            spinnerColor: spinnerColor.statefulColor.statefulFillStyle,
            backgroundColor: backgroundColor.statefulColor.statefulFillStyle,
            disabledAlpha: disabledAlpha,
            loadingAlpha: loadingAlpha
        )
    }

    @available(*, deprecated, message: "Use init with StatefulFillStyle parameters.")
    public init(
        size: ButtonSizeConfiguration = DefaultButtonSize(),
        shapeStyle: ComponentShapeStyle = .cornered,
        titleTypography: TypographyConfiguration = .default,
        titleColor: StatefulColor,
        subtitleTypography: TypographyConfiguration = .default,
        subtitleColor: StatefulColor,
        iconColor: StatefulColor,
        spinnerColor: StatefulColor,
        backgroundColor: StatefulColor,
        disabledAlpha: CGFloat = 0,
        loadingAlpha: CGFloat = 0
    ) {
        self.init(
            size: size,
            shapeStyle: shapeStyle,
            titleTypography: titleTypography,
            titleColor: titleColor.statefulFillStyle,
            subtitleTypography: subtitleTypography,
            subtitleColor: subtitleColor.statefulFillStyle,
            iconColor: iconColor.statefulFillStyle,
            spinnerColor: spinnerColor.statefulFillStyle,
            backgroundColor: backgroundColor.statefulFillStyle,
            disabledAlpha: disabledAlpha,
            loadingAlpha: loadingAlpha
        )
    }
}

extension ButtonAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: ButtonAppearance.self, fallback: ButtonAppearance())
    }
}
