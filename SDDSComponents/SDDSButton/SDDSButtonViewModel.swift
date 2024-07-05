import Foundation
import SwiftUI
import Combine
@_exported import SDDSThemeCore

/**
 `Alignment` определяет выравнивание иконки внутри кнопки.

 - Cases:
    - left: Иконка выравнивается по левому краю.
    - right: Иконка выравнивается по правому краю.
 */
public enum Alignment {
    /**
     Иконка выравнивается по левому краю.
     */
    case left
    
    /**
     Иконка выравнивается по правому краю.
     */
    case right
}

/**
 `SpinnerStyle` определяет стиль спиннера загрузки внутри кнопки.

 - Cases:
    - solid: Спиннер сплошной, скрывает содержимое кнопки во время загрузки.
    - transparent: Спиннер прозрачный, оставляет содержимое кнопки полупрозрачным во время загрузки.
 */
public enum SpinnerStyle {
    /**
     Спиннер сплошной, скрывает содержимое кнопки во время загрузки.
     */
    case solid
    
    /**
     Спиннер прозрачный, оставляет содержимое кнопки полупрозрачным во время загрузки.
     */
    case transparent
}

/**
 `ButtonLayoutMode` определяет различные режимы макета для кнопки.

 - Cases:
    - wrapContent: Кнопка автоматически подстраивает свой размер в зависимости от содержимого.
    - fixedWidth: Кнопка имеет фиксированную ширину с выравниванием содержимого (центрированное или бок о бок).
    - square: Кнопка имеет квадратную форму, где высота равна ширине.
    - circle: Кнопка имеет круглую форму, где высота равна ширине.

 - Properties:
    - isCentered: Возвращает true, если содержимое кнопки должно быть центрировано (для режима fixedWidth с центровкой).
    - isSideBySide: Возвращает true, если содержимое кнопки должно быть расположено бок о бок (для режима fixedWidth с выравниванием бок о бок).
    - title: Возвращает строку, представляющую название режима макета.
 */
public enum ButtonLayoutMode: CaseIterable, Hashable {
    /**
     Кнопка автоматически подстраивает свой размер в зависимости от содержимого.
     */
    case wrapContent
    
    /**
     Кнопка имеет фиксированную ширину с выравниванием содержимого (центрированное или бок о бок).
     
     - Parameters:
        - alignment: Выравнивание содержимого внутри фиксированной ширины (центрированное или бок о бок).
     */
    case fixedWidth(ButtonContentAlignment)
    
    /**
     Кнопка имеет квадратную форму, где высота равна ширине.
     */
    case square
    
    /**
     Кнопка имеет круглую форму, где высота равна ширине.
     */
    case circle
    
    /**
     Возвращает true, если содержимое кнопки должно быть центрировано (для режима fixedWidth с центровкой).
     */
    var isCentered: Bool {
        switch self {
        case .wrapContent, .square, .circle:
            return false
        case .fixedWidth(let alignment):
            return alignment == .centered
        }
    }
    
    /**
     Возвращает true, если содержимое кнопки должно быть расположено бок о бок (для режима fixedWidth с выравниванием бок о бок).
     */
    var isSideBySide: Bool {
        switch self {
        case .wrapContent, .square, .circle:
            return false
        case .fixedWidth(let alignment):
            return alignment == .sideBySide
        }
    }
    
    /**
     Возвращает строку, представляющую название режима макета.
     */
    public var title: String {
        switch self {
        case .wrapContent:
            return "Wrap Content"
        case .fixedWidth(let alignment):
            switch alignment {
            case .centered:
                return "Centered"
            case .sideBySide:
                return "Side by side"
            }
        case .square:
            return "Square"
        case .circle:
            return "Circle"
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    /**
     Все возможные случаи `ButtonLayoutMode`.
     */
    public static var allCases: [ButtonLayoutMode] {
        return [.wrapContent, .fixedWidth(.centered), .fixedWidth(.sideBySide), .square, .circle]
    }
}

/**
 `ButtonContentAlignment` определяет выравнивание содержимого внутри кнопки с фиксированной шириной.

 - Cases:
    - centered: Содержимое кнопки выравнивается по центру.
    - sideBySide: Содержимое кнопки выравнивается бок о бок.
 */
public enum ButtonContentAlignment {
    /**
     Содержимое кнопки выравнивается по центру.
     */
    case centered
    
    /**
     Содержимое кнопки выравнивается по бокам (по левому и правому краю) .
     */
    case sideBySide
}


/**
 `ButtonIconAttributes` содержит атрибуты иконки для кнопки.

 - Properties:
    - image: Изображение иконки, которое будет отображаться на кнопке.
    - alignment: Выравнивание иконки (левое или правое), определяемое `Alignment`.
 */
public struct ButtonIconAttributes {
    /**
     Изображение иконки, которое будет отображаться на кнопке.
     */
    public let image: Image
    
    /**
     Выравнивание иконки (левое или правое), определяемое `Alignment`.
     */
    public let alignment: Alignment
    
    /**
     Инициализатор для создания атрибутов иконки кнопки.
     
     - Parameters:
        - image: Изображение иконки.
        - alignment: Выравнивание иконки.
     */
    public init(image: Image, alignment: Alignment) {
        self.image = image
        self.alignment = alignment
    }
}

public struct ButtonTypography {
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    let xs: TypographyToken?
    let xxs: TypographyToken?
    
    public init(large: TypographyToken?, medium: TypographyToken?, small: TypographyToken?, xs: TypographyToken?, xxs: TypographyToken?) {
        self.large = large
        self.medium = medium
        self.small = small
        self.xs = xs
        self.xxs = xxs
    }
    
    public func typography(with size: ButtonSize) -> TypographyToken? {
        switch size {
        case .large:
            large
        case .medium:
            medium
        case .small:
            small
        case .xs:
            xs
        case .xxs:
            xxs
        }
    }
}

/**
 `ButtonStyle` содержит стилистические атрибуты для кнопки, включая типографику и цвета.

 - Properties:
    - titleTypographyAttributes: Типографика для заголовка кнопки, определяемая `TypographyToken` для каждого размера кнопки.
    - titleColor: Цвет заголовка кнопки, определяемый `ColorToken`.
    - subtitleTypographyAttributes: Типографика для подзаголовка кнопки, определяемая `TypographyToken` для каждого размера кнопки.
    - subtitleColor: Цвет подзаголовка кнопки, определяемый `ColorToken`.
    - iconColor: Цвет иконки кнопки, определяемый `ColorToken`.
    - spinnerColor: Цвет спиннера загрузки, определяемый `ColorToken`.
    - backgroundColor: Цвет фона кнопки, определяемый `ColorToken`.

 - Methods:
    - init(titleTypographyAttributes: [ButtonSize: TypographyToken], titleColor: ColorToken, subtitleTypographyAttributes: [ButtonSize: TypographyToken], subtitleColor: ColorToken, iconColor: ColorToken, spinnerColor: ColorToken, backgroundColor: ColorToken): Инициализирует стили кнопки с указанными параметрами.
 */
public struct ButtonStyle {
    /**
     Типографика для заголовка кнопки, определяемая `TypographyToken` для каждого размера кнопки.
     */
    public let titleTypography: ButtonTypography
    
    /**
     Цвет заголовка кнопки, определяемый `ColorToken`.
     */
    public let titleColor: ColorToken
    
    /**
     Типографика для подзаголовка кнопки, определяемая `TypographyToken` для каждого размера кнопки.
     */
    public let subtitleTypography: ButtonTypography
    
    /**
     Цвет подзаголовка кнопки, определяемый `ColorToken`.
     */
    public let subtitleColor: ColorToken
    
    /**
     Цвет иконки кнопки, определяемый `ColorToken`.
     */
    public let iconColor: ColorToken
    
    /**
     Цвет спиннера загрузки, определяемый `ColorToken`.
     */
    public let spinnerColor: ColorToken
    
    /**
     Цвет фона кнопки, определяемый `ColorToken`.
     */
    public let backgroundColor: ColorToken
    
    /**
     Инициализатор для создания стиля кнопки с указанными параметрами.
     
     - Parameters:
        - titleTypographyAttributes: Типографика для заголовка кнопки.
        - titleColor: Цвет заголовка кнопки.
        - subtitleTypographyAttributes: Типографика для подзаголовка кнопки.
        - subtitleColor: Цвет подзаголовка кнопки.
        - iconColor: Цвет иконки кнопки.
        - spinnerColor: Цвет спиннера загрузки.
        - backgroundColor: Цвет фона кнопки.
     */
    public init(
        titleTypography: ButtonTypography,
        titleColor: ColorToken,
        subtitleTypography: ButtonTypography,
        subtitleColor: ColorToken,
        iconColor: ColorToken,
        spinnerColor: ColorToken,
        backgroundColor: ColorToken) {
        self.titleTypography = titleTypography
        self.titleColor = titleColor
        self.subtitleTypography = subtitleTypography
        self.subtitleColor = subtitleColor
        self.iconColor = iconColor
        self.spinnerColor = spinnerColor
        self.backgroundColor = backgroundColor
    }
}


/**
 `SDDSButtonViewModel` содержит параметры и логику для управления кнопкой SDDSButton.

 - Parameters:
    - title: Текст, который будет отображаться на кнопке. По умолчанию пустая строка.
    - subtitle: Дополнительный текст, который будет отображаться на кнопке под заголовком. По умолчанию пустая строка.
    - iconAttributes: Атрибуты иконки для кнопки, включая изображение и выравнивание. Может быть nil, если иконка не используется.
    - size: Размер кнопки, использующий `ButtonSize` для определения высоты, радиуса скругления и отступов.
    - isDisabled: Флаг, указывающий, отключена ли кнопка. Если true, кнопка становится неактивной. По умолчанию false.
    - isLoading: Флаг, указывающий, находится ли кнопка в состоянии загрузки. Если true, отображается спиннер. По умолчанию false.
    - spinnerImage: Изображение, используемое для спиннера загрузки. Есть иконка по умолчанию..
    - spinnerStyle: Стиль спиннера, определяемый `SpinnerStyle` (solid или transparent). По умолчанию solid.
    - style: Стиль кнопки, включающий типографику, цвета текста, иконок и фона, определяемый `ButtonStyle`.
    - layoutMode: Режим макета кнопки, определяемый `ButtonLayoutMode` (wrapContent, fixedWidth, square, circle). По умолчанию wrapContent.
 */
public final class SDDSButtonViewModel: ObservableObject {
    @Published public var title: String
    @Published public var subtitle: String
    @Published public var iconAttributes: ButtonIconAttributes?
    @Published public var size: ButtonSize
    @Published public var isDisabled: Bool
    @Published public var isLoading: Bool
    @Published public var spinnerImage: Image
    @Published public var spinnerStyle: SpinnerStyle
    @Published public var style: ButtonStyle
    @Published public var layoutMode: ButtonLayoutMode
     
    public var action: () -> Void

    public init(title: String = "",
                subtitle: String = "",
                iconAttributes: ButtonIconAttributes? = nil,
                size: ButtonSize = .medium,
                isDisabled: Bool = false,
                isLoading: Bool = false,
                spinnerImage: Image = Image("spinner", bundle: Bundle(for: SDDSButtonViewModel.self)),
                spinnerStyle: SpinnerStyle = .solid,
                style: ButtonStyle,
                layoutMode: ButtonLayoutMode = .wrapContent,
                action: @escaping () -> Void = {}) {
        self.title = title
        self.subtitle = subtitle
        self.iconAttributes = iconAttributes
        self.size = size
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.spinnerImage = spinnerImage
        self.spinnerStyle = spinnerStyle
        self.style = style
        self.layoutMode = layoutMode
        self.action = action
    }
    
    var backgroundOpacity: Double {
        isDisabled ? Opacity.fourty : 1.0
    }
    
    var contentOpacity: Double {
        if isLoading && spinnerStyle == .solid {
            0.0
        } else if spinnerStyle == .transparent {
            Opacity.twenty
        } else {
            1.0
        }
    }
        
    var isCentered: Bool {
        layoutMode.isCentered
    }
    
    var isOnlyTitleAndImage: Bool {
        layoutMode.isSideBySide && !title.isEmpty && subtitle.isEmpty && iconAttributes != nil
    }
    
    var isSideBySide: Bool {
        layoutMode.isSideBySide && (!subtitle.isEmpty || iconAttributes != nil)
    }
    
    var isIconRightAligned: Bool {
        iconAttributes?.alignment == .right || (iconAttributes?.alignment == .left && isOnlyTitleAndImage)
    }
    
    var isEquilateral: Bool {
        switch layoutMode {
        case .wrapContent, .fixedWidth:
            false
        case .square, .circle:
            true
        }
    }
    
    var isCircle: Bool {
        switch layoutMode {
        case .circle:
            true
        case .fixedWidth, .wrapContent, .square:
            false
        }
    }
    
    public var titleTypography: TypographyToken {
        if let typography = style.titleTypography.typography(with: size) {
            return typography
        } else {
            print("Button Typography for size \(size.rawValue). Using a default value.")
            return .semibold16
        }
    }
    
    public var subtitleTypography: TypographyToken {
        if let typography = style.subtitleTypography.typography(with: size) {
            return typography
        } else {
            print("Button Typography for size \(size.rawValue). Using a default value.")
            return .semibold16
        }
    }
}
