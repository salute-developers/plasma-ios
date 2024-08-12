import Foundation
import SwiftUI
import Combine
@_exported import SDDSThemeCore

/**
 `ButtonStyle` определяет стили кнопки, такие как базовая, квадратная или круглая.

 - Cases:
    - basic: Базовый стиль кнопки.
    - square: Кнопка квадратной формы.
    - circle: Кнопка круглой формы.
 */
public enum ButtonStyle: String, CaseIterable {
    /// Базовый стиль кнопки.
    case basic
    
    /// Кнопка квадратной формы.
    case square
    
    /// Кнопка круглой формы.
    case circle
}


/**
 `Alignment` определяет выравнивание иконки внутри кнопки.

 - Cases:
    - left: Иконка выравнивается по левому краю.
    - right: Иконка выравнивается по правому краю.
 */
public enum Alignment: String, CaseIterable {
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
public enum SpinnerStyle: String, CaseIterable {
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
     Возвращает true, если содержимое кнопки должно быть центрировано (для режима fixedWidth с центровкой).
     */
    var isCentered: Bool {
        switch self {
        case .wrapContent:
            return false
        case .fixedWidth(let alignment):
            return alignment == .packed
        }
    }
    
    /**
     Возвращает true, если содержимое кнопки должно быть расположено бок о бок (для режима fixedWidth с выравниванием бок о бок).
     */
    var isSideBySide: Bool {
        switch self {
        case .wrapContent:
            return false
        case .fixedWidth(let alignment):
            return alignment == .spaceBetween
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
            case .packed:
                return "Packed"
            case .spaceBetween:
                return "Space Between"
            }
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    /**
     Все возможные случаи `ButtonLayoutMode`.
     */
    public static var allCases: [ButtonLayoutMode] {
        return [.wrapContent, .fixedWidth(.packed), .fixedWidth(.spaceBetween)]
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
    case packed
    
    /**
     Содержимое кнопки выравнивается по бокам (по левому и правому краю) .
     */
    case spaceBetween
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

/**
 `ButtonAppearance` содержит стилистические атрибуты для кнопки, включая типографику и цвета.

 - Properties:
    - titleTypography: Типографика для заголовка кнопки, определяемая `TypographyToken` для каждого размера кнопки.
    - titleColor: Цвет заголовка кнопки, определяемый `ColorToken`.
    - subtitleTypography: Типографика для подзаголовка кнопки, определяемая `TypographyToken` для каждого размера кнопки.
    - subtitleColor: Цвет подзаголовка кнопки, определяемый `ColorToken`.
    - iconColor: Цвет иконки кнопки, определяемый `ColorToken`.
    - spinnerColor: Цвет спиннера загрузки, определяемый `ColorToken`.
    - backgroundColor: Цвет фона кнопки, определяемый `ColorToken`.

 - Methods:
    - init(titleTypography: ButtonTypography, titleColor: ColorToken, subtitleTypography: ButtonTypography, subtitleColor: ColorToken, iconColor: ColorToken, spinnerColor: ColorToken, backgroundColor: ColorToken): Инициализирует стили кнопки с указанными параметрами.
 */
public struct ButtonAppearance {
    /**
     Типографика для заголовка кнопки, определяемая `TypographyToken` для каждого размера кнопки.
     */
    public let titleTypography: TypographyConfiguration
    
    /**
     Цвет заголовка кнопки, определяемый `ColorToken`.
     */
    public let titleColor: ColorToken
    
    /**
     Типографика для подзаголовка кнопки, определяемая `TypographyToken` для каждого размера кнопки.
     */
    public let subtitleTypography: TypographyConfiguration
    
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
     Прозрачность кнопки в выключенном состоянии.
     */
    public let disabledAlpha: CGFloat
    
    /**
     Прозрачность кнопки в состоянии загрузки.
     */
    public let loadingAlpha: CGFloat
    
    /**
     Инициализатор для создания стиля кнопки с указанными параметрами.
     
     - Parameters:
        - titleTypography: Типографика для заголовка кнопки.
        - titleColor: Цвет заголовка кнопки.
        - subtitleTypography: Типографика для подзаголовка кнопки.
        - subtitleColor: Цвет подзаголовка кнопки.
        - iconColor: Цвет иконки кнопки.
        - spinnerColor: Цвет спиннера загрузки.
        - backgroundColor: Цвет фона кнопки.
     */
    public init(
        titleTypography: TypographyConfiguration,
        titleColor: ColorToken,
        subtitleTypography: TypographyConfiguration,
        subtitleColor: ColorToken,
        iconColor: ColorToken,
        spinnerColor: ColorToken,
        backgroundColor: ColorToken,
        disabledAlpha: CGFloat,
        loadingAlpha: CGFloat
    ) {
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

/**
 `ButtonAccessibility` содержит параметры доступности для кнопки.

 - Properties:
    - label: Метка доступности для кнопки.
    - hint: Подсказка доступности для кнопки.
    - value: Значение доступности для кнопки.
 */
public struct ButtonAccessibility {
    public var label: String
    public var hint: String
    public var value: String
    
    /**
     Инициализатор для создания параметров доступности кнопки.
     
     - Parameters:
        - label: Метка доступности для кнопки.
        - hint: Подсказка доступности для кнопки.
        - value: Значение доступности для кнопки.
     */
    public init(label: String, hint: String, value: String) {
        self.label = label
        self.hint = hint
        self.value = value
    }
    
    /**
     Инициализатор для создания параметров доступности кнопки с пустыми значениями.
     */
    public init() {
        self.label = ""
        self.hint = ""
        self.value = ""
    }
}

public struct SDDSButton: View {
    public let title: String
    public let subtitle: String
    public let iconAttributes: ButtonIconAttributes?
    public let size: ButtonSizeConfiguration
    public let isDisabled: Bool
    public let isLoading: Bool
    public let spinnerImage: Image
    public let spinnerStyle: SpinnerStyle
    public let buttonStyle: SDDSComponents.ButtonStyle
    public let appearance: ButtonAppearance
    public let layoutMode: ButtonLayoutMode
    public let accessibility: ButtonAccessibility
    
    @Environment(\.colorScheme) var colorScheme
    @State private var isAnimating: Bool = false
     
    public var action: () -> Void
    
    /**
         Инициализатор для создания кнопки `SDDSButton`.
         
         - Parameters:
            - title: Название кнопки, отображаемое на кнопке.
            - subtitle: Подзаголовок кнопки, отображаемый под названием.
            - iconAttributes: Атрибуты иконки, включающие изображение и выравнивание иконки (по умолчанию nil).
            - size: Конфигурация размера кнопки, определяемая `ButtonSizeConfiguration`.
            - isDisabled: Булево значение, определяющее, отключена ли кнопка (по умолчанию false).
            - isLoading: Булево значение, определяющее, находится ли кнопка в состоянии загрузки (по умолчанию false).
            - spinnerImage: Изображение спиннера загрузки (по умолчанию Image("spinner")).
            - spinnerStyle: Стиль спиннера загрузки, определяемый `SpinnerStyle` (по умолчанию .solid).
            - buttonStyle: Стиль кнопки, определяемый `SDDSComponents.ButtonStyle` (по умолчанию .basic).
            - appearance: Стилистические атрибуты кнопки, включающие типографику и цвета, определяемые `ButtonAppearance`.
            - layoutMode: Режим макета кнопки, определяемый `ButtonLayoutMode` (по умолчанию .wrapContent).
            - accessibility: Параметры доступности для кнопки, определяемые `ButtonAccessibility`.
            - action: Действие, выполняемое при нажатии на кнопку.
    */
    public init(
        title: String,
        subtitle: String,
        iconAttributes: ButtonIconAttributes? = nil,
        size: ButtonSizeConfiguration,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        spinnerImage: Image = Image("spinner", bundle: Bundle(for: Components.self)),
        spinnerStyle: SpinnerStyle = .solid,
        buttonStyle: SDDSComponents.ButtonStyle = .basic,
        appearance: ButtonAppearance,
        layoutMode: ButtonLayoutMode = .wrapContent,
        accessibility: ButtonAccessibility = ButtonAccessibility(),
        action: @escaping () -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.iconAttributes = iconAttributes
        self.size = size
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.spinnerImage = spinnerImage
        self.spinnerStyle = spinnerStyle
        self.buttonStyle = buttonStyle
        self.appearance = appearance
        self.layoutMode = layoutMode
        self.accessibility = accessibility
        self.action = action
    }
    
    public var body: some View {
        ZStack {
            Button {
                action()
            } label: {
                switch buttonStyle {
                case .basic:
                    basicButton
                case .square, .circle:
                    equilateralButton
                }
            }
            .opacity(contentOpacity)
            .background(backgroundColor(for: colorScheme))
            .applyIf(!isCircle, transform: { $0.cornerRadius(size.cornerRadius) })
            .frame(height: size.height)
            .disabled(isDisabled)
            .accessibility(label: Text(accessibility.label))
            .accessibility(hint: Text(accessibility.hint))
            .accessibility(value: Text(accessibility.value))
            
            if isLoading {
                spinner
                    .frame(width: size.spinnerSize.width, height: size.spinnerSize.height)
            }
        }
        .applyIf(isCircle, transform: { $0.clipShape(Circle()) })
    }
        
    @ViewBuilder
    private var basicButton: some View {
        HStack {
            if isCentered {
                Spacer()
            }
            if shouldShowLeftAlignedIcon() {
                icon
                if !title.isEmpty {
                    Spacer().frame(width: size.iconHorizontalGap)
                }
            }
            if !title.isEmpty {
                Text(title)
                    .typography(titleTypography)
                    .foregroundColor(appearance.titleColor.color(for: colorScheme))
            }
            if isSideBySide {
                Spacer()
            }
            if !subtitle.isEmpty {
                if !title.isEmpty {
                    Spacer().frame(width: size.titleHorizontalGap)
                }
                Text(subtitle)
                    .typography(subtitleTypography)
                    .foregroundColor(appearance.subtitleColor.color(for: colorScheme))
            }
            if shouldShowRightAlignedIcon() {
                if hasTitleOrSubtitle() {
                    Spacer().frame(width: size.titleHorizontalGap)
                }
                icon
            }
            if isCentered {
                Spacer()
            }
        }
        .frame(
            minHeight: max(
                subtitleTypography.lineHeight,
                titleTypography.lineHeight
            ),
            maxHeight: size.iconSize.height
        )
        .padding(size.paddings)
    }
    
    @ViewBuilder
    private var equilateralButton: some View {
        Group {
            if hasIconAttributes() {
                icon
            } else {
                Spacer()
            }
        }
        .frame(width: size.height, height: size.height)
    }
    
    @ViewBuilder
    private var icon: some View {
        if let iconAttributes = iconAttributes {
            iconAttributes.image
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundColor(appearance.iconColor.color(for: colorScheme))
                .frame(
                    width: size.iconSize.width,
                    height: size.iconSize.height
                )
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var spinner: some View {
        if isLoading {
            SpinnerView(
                image: spinnerImage,
                foregroundColor: appearance.spinnerColor.color(for: colorScheme)
            )
        } else {
            EmptyView()
        }
    }
}
