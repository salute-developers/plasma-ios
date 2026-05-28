import Foundation
import SwiftUI
import Combine
@_exported import SDDSThemeCore

/**
 `SDDSButton` представляет собой компонент кнопки с различными стилями и состояниями.
 
 - Parameters:
   - title: Основной текст кнопки
   - subtitle: Дополнительный текст кнопки (опционально)
   - iconAttributes: Атрибуты иконки (опционально)
   - isDisabled: Флаг отключенного состояния
   - isLoading: Флаг состояния загрузки
   - spinnerImage: Изображение для индикатора загрузки
   - buttonStyle: Стиль кнопки (.basic или .icon) ``ButtonStyle``
   - appearance: Кастомизация внешнего вида
   - layoutMode: Режим компоновки (.wrapContent или .fillWidth) ``ButtonLayoutMode``
   - accessibility: Параметры доступности
   - counterViewProvider: Провайдер для отображения счетчика
   - isSelected: Флаг выбранного состояния
   - action: Действие при нажатии на кнопку

 ## Окружение
 - `buttonAppearance`: Стандартные настройки внешнего вида кнопок

 ## Пример использования

 ```swift
 // Базовая кнопка с иконкой
 BasicButton(
     title: "Label",
     subtitle: "Value",
     iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
     isDisabled: false,
     isLoading: false,
     spinnerImage: Image.image("spinner"),
     appearance: BasicButton.l.accent.appearance,
     layoutMode: .wrapContent,
     action: { print("Button did tap") }
 )

 // Кнопка-ссылка с акцентным стилем
 LinkButton(
     title: "Label",
     iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
     isDisabled: false,
     isLoading: false,
     spinnerImage: Image.image("spinner"),
     appearance: LinkButton.l.accent.appearance,
     layoutMode: .wrapContent,
     action: { print("Link did tap") }
 )

 // Кнопка-иконка с акцентным стилем
 IconButton(
     iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
     isDisabled: false,
     isLoading: false,
     spinnerImage: Image.image("spinner"),
     appearance: IconButton.l.accent.appearance,
     layoutMode: .fixedWidth(.packed),
     action: { print("Icon did tap") }
 )

 // Круглая кнопка-иконка с акцентным стилем
IconButton(
     iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
     isDisabled: false,
     isLoading: false,
     spinnerImage: Image.image("spinner"),
     appearance: IconButton.l.pilled.accent.appearance,
     layoutMode: .wrapContent,
     action: { print("Rounded Icon did tap") }
 )
 ```
 */
public struct SDDSButton<Counter: View>: View {
    public let title: String
    public let subtitle: String
    public let iconAttributes: ButtonIconAttributes?
    public let isDisabled: Bool
    public let isLoading: Bool
    public let spinnerImage: Image?
    public let buttonStyle: SDDSComponents.ButtonStyle
    public let layoutMode: ButtonLayoutMode
    public let accessibility: ButtonAccessibility
    public let counter: Counter
    public let isSelected: Bool
    private var _appearance: ButtonAppearance?
    @Environment(\.buttonAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    @State private var isAnimating: Bool = false
    @State private var isHighlighted: Bool = false
    @State private var isHovered: Bool = false
    
    public var action: () -> Void
    
    public init(
        title: String,
        subtitle: String,
        iconAttributes: ButtonIconAttributes? = nil,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        spinnerImage: Image? = Image("spinner", bundle: Bundle(for: Components.self)),
        buttonStyle: SDDSComponents.ButtonStyle = .basic,
        appearance: ButtonAppearance? = nil,
        layoutMode: ButtonLayoutMode = .wrapContent,
        accessibility: ButtonAccessibility = ButtonAccessibility(),
        @ViewBuilder counter: () -> Counter = { EmptyView() },
        isSelected: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.iconAttributes = iconAttributes
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.spinnerImage = spinnerImage
        self.buttonStyle = buttonStyle
        self._appearance = appearance
        self.layoutMode = layoutMode
        self.accessibility = accessibility
        self.isSelected = isSelected
        self.action = action
        self.counter = counter()
    }
    
    public var body: some View {
        ZStack {
            Button {
                guard !isDisabled else { return }
                action()
            } label: {
                switch buttonStyle {
                case .basic:
                    basicButton
                case .icon:
                    equilateralButton
                }
            }
            .buttonStyle(NoHighlightButtonStyle())
            .opacity(contentOpacity)
            .background(buttonBackground)
            .shape(pathDrawer: appearance.size.pathDrawer)
            .frame(height: appearance.size.height)
            .disabled(isDisabled)
            .accessibility(label: Text(accessibility.label))
            .accessibility(hint: Text(accessibility.hint))
            .accessibility(value: Text(accessibility.value))
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        guard !isDisabled else { return }
                        isHighlighted = true
                    }
                    .onEnded { _ in
                        isHighlighted = false
                    }
            )
            .onHover { hovering in
                isHovered = isDisabled ? false : hovering
            }
            if isLoading {
                spinner
                    .frame(width: appearance.size.spinnerSize.width, height: appearance.size.spinnerSize.height)
            }
        }
    }
    
    @ViewBuilder
    private var basicButton: some View {
        HStack(spacing: 0) {
            if isCentered {
                spacer
            }
            if shouldShowLeftAlignedIcon() {
                icon
                if !title.isEmpty {
                    Spacer().frame(width: appearance.size.iconHorizontalGap)
                }
            }
            if !title.isEmpty {
                value(for: title, typographyToken: titleTypography, textColor: appearance.titleColor)
                    .fixedSize()
            }
            if isSideBySide {
                Spacer()
            }
            counter
                .fixedSize()
            if !subtitle.isEmpty {
                if !title.isEmpty {
                    Spacer().frame(width: appearance.size.titleHorizontalGap)
                }
                value(for: subtitle, typographyToken: subtitleTypography, textColor: appearance.subtitleColor)
                    .fixedSize()
            }
            if shouldShowRightAlignedIcon() {
                if hasTitleOrSubtitle() {
                    if subtitle.isEmpty {
                        Spacer().frame(width: appearance.size.iconHorizontalGap)
                    } else {
                        Spacer().frame(width: appearance.size.titleHorizontalGap)
                    }
                }
                icon
            }
            if isCentered {
                spacer
            }
        }
        .frame(height: appearance.size.height)
        .padding(.leading, appearance.size.paddings.leading)
        .padding(.trailing, appearance.size.paddings.trailing)
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
        .frame(width: appearance.size.height, height: appearance.size.height)
    }
    
    @ViewBuilder
    private var icon: some View {
        if let iconAttributes = iconAttributes {
            let iconView = iconAttributes.image
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(
                    width: appearance.size.iconSize.width,
                    height: appearance.size.iconSize.height
                )
            let fillStyle = currentFillStyle(for: appearance.iconColor)

            switch fillStyle {
            case .color(let colorToken):
                iconView.foregroundColor(colorToken.color(for: colorScheme))
            case .gradient:
                iconView.fillForeground(style: fillStyle)
            }
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var spinner: some View {
        if let spinnerImage = spinnerImage, isLoading {
            SpinnerView(image: spinnerImage, fillStyle: currentFillStyle(for: appearance.spinnerColor))
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func value(for text: String, typographyToken: TypographyToken, textColor: StatefulFillStyle) -> some View {
        let textView = Text(text)
            .lineLimit(1)
            .typography(typographyToken)
        let fillStyle = currentFillStyle(for: textColor)

        switch fillStyle {
        case .color(let colorToken):
            // Preserve legacy StatefulColor behavior (without subtheme remap) for solid colors.
            textView.foregroundColor(colorToken.color(for: colorScheme))
        case .gradient:
            textView.fillForeground(style: fillStyle)
        }
    }
}

public extension SDDSButton where Counter == EmptyView {
    init(data: ButtonData) {
        self.init(
            title: data.title,
            subtitle: data.subtitle,
            iconAttributes: data.iconAttributes,
            isDisabled: data.isDisabled,
            isLoading: data.isLoading,
            spinnerImage: data.spinnerImage,
            buttonStyle: data.buttonStyle,
            appearance: data.appearance,
            layoutMode: data.layoutMode,
            accessibility: data.accessibility,
            isSelected: data.isSelected,
            action: data.action
        )
    }
}

private extension SDDSButton {
    func currentFillStyle(for statefulFillStyle: StatefulFillStyle) -> FillStyle {
        var activeStates = Set<InteractiveState>()
        if isSelected { activeStates.insert(.selected) }
        if isHighlighted { activeStates.insert(.pressed) }
        if isHovered { activeStates.insert(.hovered) }
        return statefulFillStyle.resolvedValue(for: activeStates)
    }

    @ViewBuilder
    var buttonBackground: some View {
        switch currentFillStyle(for: appearance.backgroundColor) {
        case .color(let colorToken):
            colorToken.color(for: colorScheme, subtheme: subtheme).opacity(backgroundOpacity)
        case .gradient(let gradientToken):
            Rectangle()
                .fill(colorScheme == .dark ? Color.black : Color.white)
                .gradient(gradientToken, colorScheme: colorScheme, subtheme: subtheme)
                .opacity(backgroundOpacity)
        }
    }
    
    func hasIconAttributes() -> Bool {
        return iconAttributes != nil
    }
    
    var backgroundOpacity: Double {
        isDisabled ? Opacity.fourty : 1.0
    }
    
    var contentOpacity: Double {
        if isDisabled {
            return appearance.disabledAlpha
        }
        if isLoading {
            return appearance.loadingAlpha
        } else {
            return 1.0
        }
    }
    
    var isCentered: Bool {
        layoutMode.isCentered
    }
    
    var isSideBySide: Bool {
        layoutMode.isSideBySide && (!subtitle.isEmpty || iconAttributes != nil)
    }
    
    var isEquilateral: Bool {
        switch buttonStyle {
        case .icon:
            return true
        case .basic:
            return false
        }
    }
    
    var isCircle: Bool {
        switch buttonStyle {
        case .icon:
            return appearance.shapeStyle == .pilled
        default:
            return false
        }
    }
    
    func shouldShowRightAlignedIcon() -> Bool {
        return isIconRightAligned && hasIconAttributes()
    }
    
    func shouldShowLeftAlignedIcon() -> Bool {
        return !shouldShowRightAlignedIcon() && hasIconAttributes()
    }
    
    func hasTitleOrSubtitle() -> Bool {
        return !title.isEmpty || !subtitle.isEmpty
    }
    
    var isOnlyTitleAndImage: Bool {
        layoutMode.isSideBySide && !title.isEmpty && subtitle.isEmpty && iconAttributes != nil
    }
    
    var isIconRightAligned: Bool {
        iconAttributes?.alignment == .trailing || (iconAttributes?.alignment == .leading && isOnlyTitleAndImage)
    }
    
    var titleTypography: TypographyToken {
        if let typography = appearance.titleTypography.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Button Typography for size \(appearance.size.debugDescription).")
        }
    }
    
    var subtitleTypography: TypographyToken {
        if let typography = appearance.subtitleTypography.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Button Typography for size \(appearance.size.debugDescription). Using a default value.")
        }
    }
    
    var spacer: some View {
        GeometryReader { geometry in
            Color.clear
                .frame(width: geometry.size.width)
        }
    }
    
    var appearance: ButtonAppearance {
        _appearance ?? environmentAppearance
    }
}

private struct NoHighlightButtonStyle: SwiftUI.ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.0 : 1.0)
            .animation(.none, value: configuration.isPressed)
    }
}
