import Foundation
@_exported import SDDSThemeCore

/**
 `ButtonAppearance` определяет стили кнопки, включая типографику, цвета, размеры и другие параметры.

 - Properties:
    - size: Конфигурация размеров кнопки, определяемая `ButtonSizeConfiguration`.
    - shapeStyle: Стиль формы кнопки (например, закругленная или овальная), определяемый `ButtonShapeStyle`.
    - titleTypography: Типографика для текста заголовка кнопки, определяемая `TypographyConfiguration`.
    - titleColor: Цвет текста заголовка кнопки для различных состояний, определяемый `ButtonColor`.
    - subtitleTypography: Типографика для текста подзаголовка кнопки, определяемая `TypographyConfiguration`.
    - subtitleColor: Цвет текста подзаголовка кнопки для различных состояний, определяемый `ButtonColor`.
    - iconColor: Цвет иконки кнопки для различных состояний, определяемый `ButtonColor`.
    - spinnerColor: Цвет спиннера загрузки для различных состояний, определяемый `ButtonColor`.
    - backgroundColor: Цвет фона кнопки для различных состояний, определяемый `ButtonColor`.
    - disabledAlpha: Прозрачность кнопки, когда она отключена.
    - loadingAlpha: Прозрачность кнопки, когда она находится в состоянии загрузки.
 
 - Methods:
    - init: Инициализирует стили кнопки с заданными параметрами.
 */
public struct ButtonAppearance {

    /**
     Конфигурация размеров кнопки, определяемая `ButtonSizeConfiguration`.
     */
    public let size: ButtonSizeConfiguration
    
    /**
     Стиль формы кнопки (например, закругленная или овальная), определяемый `ButtonShapeStyle`.
     */
    public let shapeStyle: ButtonShapeStyle
    
    /**
     Типографика для текста заголовка кнопки, определяемая `TypographyConfiguration`.
     */
    public let titleTypography: TypographyConfiguration
    
    /**
     Цвет текста заголовка кнопки для различных состояний, определяемый `ButtonColor`.
     */
    public let titleColor: ButtonColor
    
    /**
     Типографика для текста подзаголовка кнопки, определяемая `TypographyConfiguration`.
     */
    public let subtitleTypography: TypographyConfiguration
    
    /**
     Цвет текста подзаголовка кнопки для различных состояний, определяемый `ButtonColor`.
     */
    public let subtitleColor: ButtonColor
    
    /**
     Цвет иконки кнопки для различных состояний, определяемый `ButtonColor`.
     */
    public let iconColor: ButtonColor
    
    /**
     Цвет спиннера загрузки для различных состояний, определяемый `ButtonColor`.
     */
    public let spinnerColor: ButtonColor
    
    /**
     Цвет фона кнопки для различных состояний, определяемый `ButtonColor`.
     */
    public let backgroundColor: ButtonColor
    
    /**
     Прозрачность кнопки, когда она отключена.
     */
    public let disabledAlpha: CGFloat
    
    /**
     Прозрачность кнопки, когда она находится в состоянии загрузки.
     */
    public let loadingAlpha: CGFloat
    
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
        shapeStyle: ButtonShapeStyle = .default,
        titleTypography: TypographyConfiguration = .default,
        titleColor: ButtonColor = ButtonColor(),
        subtitleTypography: TypographyConfiguration = .default,
        subtitleColor: ButtonColor = ButtonColor(),
        iconColor: ButtonColor = ButtonColor(),
        spinnerColor: ButtonColor = ButtonColor(),
        backgroundColor: ButtonColor = ButtonColor(),
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
}